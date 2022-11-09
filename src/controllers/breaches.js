import { mainLayout } from '../views/layouts/main.js'
import { breaches } from '../views/partials/breaches.js'
import { setBreachResolution, setBreachesResolved, updateBreachStats } from '../db/tables/subscribers.js'
import { getUserEmails } from '../db/tables/email_addresses.js'
import { getBreachesForEmail, filterBreaches } from '../utils/hibp.js'
import { filterBreachDataTypes } from '../utils/breach-resolution.js'
import { getSha1 } from '../utils/fxa.js'
async function breachesPage (req, res) {
  // TODO: remove: to test out getBreaches call with JSON returns
  const breachesData = await getAllEmailsAndBreaches(req.user, req.app.locals.breaches)
  const data = {
    locale: req.appLocale,
    breachesData,
    partial: breaches
  }

  res.send(mainLayout(data))
}

/**
 * Get breaches from the database and return a JSON object
 * TODO: Takes in additional query parameters:
 *
 * status: enum (resolved, unresolved)
 * email: string
 * @param {object} req
 * @param {object} res
 */
async function getBreaches (req, res) {
  const allBreaches = req.app.locals.breaches
  const sessionUser = req.user
  const resp = await getAllEmailsAndBreaches(sessionUser, allBreaches)
  return res.json(resp)
}

/**
 * Modify breach resolution for a user
 * @param {object} req containing {user, body: {affectedEmail, recencyIndex, resolutionsChecked, isUnresolve}}
 *
 * recencyIndex: corresponds to the relevant breach from HIBP
 *
 * resolutionsChecked: has the following structure [DataTypes]
 *
 * @param {object} res JSON object containing the updated breach resolution
 */
async function putBreachResolution (req, res) {
  const sessionUser = req.user
  const { affectedEmail, recencyIndex, resolutionsChecked } = req.body
  const isResolved = false
  const resp = {}
  const recencyIndexNumber = Number(recencyIndex)
  const affectedEmailIsSubscriberRecord = sessionUser.primary_email === affectedEmail
  const affectedEmailInEmailAddresses = sessionUser.email_addresses.filter(ea => ea.email === affectedEmail)

  if (!affectedEmailIsSubscriberRecord && !affectedEmailInEmailAddresses) {
    return res.json('Error: affectedEmail is not valid for this subscriber')
  }

  // first fetch the affectEmail's breaches, check if recencyIndex / resolutionsChecked make sense
  // 1. check if recency index is a part of affectEmail's breaches
  const allBreaches = req.app.locals.breaches
  const { verifiedEmails } = await getAllEmailsAndBreaches(req.session.user, allBreaches)

  // 2. check if resolutionsChecked array is a subset of the breaches' datatypes

  // update old breach_resolved for backwards compatibility when a breach is resolved
  // TODO: deprecate

  if (isResolved) {
    const oldBreachResolution = breachResolvedJSON({
      user: sessionUser,
      affectedEmail,
      isResolved,
      recencyIndexNumber
    })

    await setBreachesResolved({ user: sessionUser, oldBreachResolution })
  }

  /* new JsonB:
  {
    email_id: {
      recency_index: {
        resolutions: ['email', ...],
        isActive: true
      }
    }
  }
*/

  const currentBreachDataTypes = [] // get this from existing breaches
  const currentBreachResolution = {} // get this from existing breach resolution if available
  currentBreachResolution[affectedEmail] = {
    [recencyIndexNumber]: {
      resolutions: resolutionsChecked,
      isActive: resolutionsChecked.length < currentBreachDataTypes.length,
      status: this.isActive ? 'unresolved' : 'resolved'
    }
  }

  const updatedSubscriber = await setBreachResolution({
    user: sessionUser, currentBreachResolution
  })

  req.session.user = updatedSubscriber
  // return res.json("Breach marked as resolved.");
  // Currently we're sending { affectedEmail, recencyIndex, isResolved, passwordsExposed } in req.body
  // Not sure if we need all of these or need to send other/additional values?

  // if (isResolved === 'true') {
  //   // the user clicked "Undo" so mark the breach as unresolved
  //   return res.redirect('/')
  // }

  const userBreachStats = oldBreachStats(verifiedEmails)

  await updateBreachStats(sessionUser.id, userBreachStats)

  res.json(resp)
}

// PRIVATE

/**
 * TODO: deprecate
 * Get all emails and breaches for a user via app.locals
 * This function will be replaced after 'breaches" table is created
 * and all records can be retrieved from the one table
 * @param {*} user
 * @param {*} allBreaches
 * @returns
 */
async function getAllEmailsAndBreaches (user, allBreaches) {
  const monitoredEmails = await getUserEmails(user.id)
  const verifiedEmails = []
  const unverifiedEmails = []
  verifiedEmails.push(await bundleVerifiedEmails({ user, email: user.primary_email, recordId: user.id, recordVerified: user.primary_verified, allBreaches }))
  for (const email of monitoredEmails) {
    if (email.verified) {
      verifiedEmails.push(await bundleVerifiedEmails({ user, email: email.email, recordId: email.id, recordVerified: email.verified, allBreaches }))
    } else {
      unverifiedEmails.push(email)
    }
  }

  // get new breaches since last shown
  for (const emailEntry of verifiedEmails) {
    const newBreachesForEmail = emailEntry.breaches.filter(breach => breach.AddedDate >= user.breaches_last_shown)

    for (const newBreachForEmail of newBreachesForEmail) {
      newBreachForEmail.NewBreach = true // add "NewBreach" property to the new breach.
      emailEntry.hasNewBreaches = newBreachesForEmail.length // add the number of new breaches to the email
    }
  }

  return { verifiedEmails, unverifiedEmails }
}

function addRecencyIndex (foundBreaches) {
  const annotatedBreaches = []
  // slice() the array to make a copy so before reversing so we don't
  // reverse foundBreaches in-place
  const oldestToNewestFoundBreaches = foundBreaches.slice().reverse()
  oldestToNewestFoundBreaches.forEach((annotatingBreach, index) => {
    const foundBreach = foundBreaches.find(foundBreach => foundBreach.Name === annotatingBreach.Name)
    annotatedBreaches.push(Object.assign({ recencyIndex: index }, foundBreach))
  })
  return annotatedBreaches.reverse()
}

async function bundleVerifiedEmails (options) {
  const { user, email, recordId, recordVerified, allBreaches } = options
  const lowerCaseEmailSha = getSha1(email.toLowerCase())

  // find all breaches relevant to the current email
  const foundBreaches = await getBreachesForEmail(lowerCaseEmailSha, allBreaches, true, false)

  // adding index to breaches based on recency
  const foundBreachesWithRecency = addRecencyIndex(foundBreaches)

  // get v1 "breaches_resolved" object
  const resolvedBreachesV1 = user.breaches_resolved
    ? user.breaches_resolved[email] ? user.breaches_resolved[email] : []
    : []

  // get v2 "breach_resolution" object
  const breachResolutionV2 = user.breach_resolution
    ? user.breach_resolution[email] ? user.breach_resolution[email] : {}
    : []

  for (const breach of foundBreachesWithRecency) {
    // add resolved status from v1: breach_resolved
    breach.IsResolved = !!resolvedBreachesV1.includes(breach.recencyIndex)

    // add resolved status from v2: breach_resolution
    if (breachResolutionV2[breach.recencyIndex] && !breach.IsResolved) {
      const IsResolved = !breachResolutionV2[breach.recencyIndex].isActive
      breach.IsResolved = breach.IsResolved || IsResolved
      breach.ResolutionsChecked = breachResolutionV2[breach.recencyIndex].resolutionsChecked ?? []
    }

    // filter breach types based on the 13 types we care about
    breach.DataClasses = filterBreachDataTypes(breach.DataClasses)
  }

  // filter out irrelevant breaches based on HIBP
  const filteredAnnotatedFoundBreaches = filterBreaches(foundBreachesWithRecency)

  const emailEntry = {
    email,
    breaches: filteredAnnotatedFoundBreaches,
    primary: email === user.primary_email,
    id: recordId,
    verified: recordVerified
  }

  return emailEntry
}

/**
 * TODO: DEPRECATE
 * This utiliy function is maintained to keep backwards compatibility with V1.
 * After v2 is launched, we will deprecate this function
 * @param {object} verifiedEmails [{breaches: [isResolved: true/false, dataClasses: []]}]
 * @returns {object} breachStats
 * {
 *    monitoredEmails: {
      count: 0
    },
    numBreaches: {
      count: 0,
      numResolved: 0
      numUnresolved: 0
    },
    passwords: {
      count: 0,
      numResolved: 0
    }
  }
 */
function oldBreachStats (verifiedEmails) {
  const breachStats = {
    monitoredEmails: {
      count: 0
    },
    numBreaches: {
      count: 0,
      numResolved: 0
    },
    passwords: {
      count: 0,
      numResolved: 0
    }
  }
  let foundBreaches = []

  // combine the breaches for each account, breach duplicates are ok
  // since the user may have multiple accounts with different emails
  verifiedEmails.forEach(email => {
    email.breaches.forEach(breach => {
      if (breach.IsResolved) {
        breachStats.numBreaches.numResolved++
      }

      const dataClasses = breach.DataClasses
      if (dataClasses.includes('passwords')) {
        breachStats.passwords.count++
        if (breach.IsResolved) {
          breachStats.passwords.numResolved++
        }
      }
    })
    foundBreaches = [...foundBreaches, ...email.breaches]
  })

  // total number of verified emails being monitored
  breachStats.monitoredEmails.count = verifiedEmails.length

  // total number of breaches across all emails
  breachStats.numBreaches.count = foundBreaches.length

  breachStats.numBreaches.numUnresolved = breachStats.numBreaches.count - breachStats.numBreaches.numResolved

  return breachStats
}

/**
 * TODO: deprecate
 * Create JSON object for column 'breach_resolved'
 * @param {object} options { user, affectedEmail, isResolved, recencyIndexNumber}
 * @returns {object} json object for 'breach_resolved' column
 */
function breachResolvedJSON (options) {
  const {
    user,
    affectedEmail,
    isResolved,
    recencyIndexNumber
  } = options
  const userBreachesResolved = user.breaches_resolved === null ? {} : user.breaches_resolved
  if (isResolved === 'false') {
    if (Array.isArray(userBreachesResolved[affectedEmail])) {
      userBreachesResolved[affectedEmail].push(recencyIndexNumber)
      return userBreachesResolved
    }
    userBreachesResolved[affectedEmail] = [recencyIndexNumber]
    return userBreachesResolved
  }
  userBreachesResolved[affectedEmail] = userBreachesResolved[affectedEmail].filter(el => el !== recencyIndexNumber)
  return userBreachesResolved
}

export { breachesPage, putBreachResolution, getBreaches }
