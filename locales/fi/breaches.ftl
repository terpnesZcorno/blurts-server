# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


## Breaches header

# Data classes pie chart title
breach-chart-title = Vuodetut tiedot
# $email-select is an interactive <select> element displaying the current email address
breach-heading-email = Osoitetta { $email-select } koskevat tietovuodot
# $count is the number of emails a user has added out of $total allowed
emails-monitored =
    { $total ->
        [one] { $count }/{ $total } sähköpostiosoite valvonnassa
       *[other] { $count }/{ $total } sähköpostiosoitetta valvonnassa
    }
# link to Settings page where user can add/remove emails and set message preferences
manage-emails-link = Hallitse sähköpostiosoitteita

## Breaches resolved filter

filter-label-unresolved = Selvittämättömät vuodot
filter-label-resolved = Selvitetyt vuodot

## Breaches table

column-company = YHTIÖ
column-breached-data = VUODETUT TIEDOT
column-detected = HAVAITTU
# “Resolved” is shown next to a breach if all recommended actions in response to the breach have been taken.
column-status-badge-resolved = Selvitetty
# “Active” is shown next to a breach if the user still has at least one recommended action to perform in response to the breach.
column-status-badge-active = Aktiivinen
breaches-resolve-heading = Selvitä tämä vuoto:
breaches-none-headline = Tietovuotoja ei löytynyt
# Variables:
#   $email (String) - An email address that we did not find breaches for, e.g. `someone@example.com`
breaches-none-copy = Hyviä uutisia! Sähköpostiosoitetta { $email } ei löytynyt tunnettuista tietovuodoista. Seuraamme tätä sähköpostiosoitetta ja ilmoitamme sinulle, jos tietovuotoja havaitaan.
breaches-none-cta-blurb = Haluatko seurata myös muita sähköpostiosoitteita?
breaches-none-cta-button = Lisää sähköpostiosoite
breaches-all-resolved-headline = Kaikki tietovuodot selvitetty
# Variables:
#   $email (String) - An email address for which all breaches have been resolved, e.g. `someone@example.com`
breaches-all-resolved-copy = Hyvin toimittu! Olet selvittänyt kaikki sähköpostiosoitetta { $email } koskevat tietovuodot. Seuraamme tätä sähköpostia ja ilmoitamme sinulle, jos tietovuotoja havaitaan.
breaches-all-resolved-cta-blurb = Haluatko seurata myös muita sähköpostiosoitteita?
breaches-all-resolved-cta-button = Lisää sähköpostiosoite
# $breachDate and $addedDate are dates that should be localized via JS DateTimeFormat(). $dataClasses is a list of strings from data-classes.ftl that should be localized via JS ListFormat()
breach-description = Yhtiön { $companyName } tiedot vuodettiin { $breachDate }. Kun tietovuoto havaittiin ja vahvistettiin, se lisättiin tietokantaamme { $addedDate }. Tämä vuoto sisältää: { $dataClasses }

## Links that we might refer to when prompting the user to make changes after a breach

breach-checklist-link-firefox-relay = { -brand-relay }
breach-checklist-link-password-manager = { -brand-firefox }in salasananhallinta
breach-checklist-link-mozilla-vpn = { -brand-mozilla-vpn }

## Prompts the user for changes when there is a breach detected of password

# { $breachedCompanyLink } will link to the website of the company where the breach occurred
breach-checklist-pw-header-2 = Siirry yrityksen verkkosivustolle vaihtaaksesi salasanasi ja ottaaksesi kaksivaiheisen todennuksen (2FA) käyttöön.
# Variables:
#   $passwordManagerLink (string) - a link to the password manager documentation, with { -breach-checklist-link-password-manager } as the label
breach-checklist-pw-body-2 = Varmista, että salasanasi on yksilöllinen ja vaikea arvata. Jos käytät tätä salasanaa muilla tileillä, muista vaihtaa salasana kyseisillä tileillä. { $passwordManagerLink } voi auttaa sinua pitämään kirjaa kaikista salasanoistasi turvallisesti.

## Prompts the user for changes when there is a breach detected of email

# Variables:
#   $firefoxRelayLink (string) - a link to Firefox Relay, with { -breach-checklist-link-firefox-relay } as the label
breach-checklist-email-header-2 = Suojaa sähköpostisi { $firefoxRelayLink }n kaltaisella sähköpostin maskipalvelulla.
breach-checklist-email-body = Tämä voi piilottaa todellisen sähköpostiosoitteesi samalla, kun sähköpostit lähetetään edelleen oikeaan postilaatikkoosi.

## Prompts the user for changes when there is a breach detected of social security number

# Credit reports list your bill payment history, loans, current debt, and other financial information. 
# They show where you work and live and whether you've been sued, arrested, or filed for bankruptcy.
breach-checklist-ssn-header = Tarkkaile luottotietojasi sellaisten tilien, lainojen tai luottokorttien varalta, joita et tunnista.
# A security freeze prevents prospective creditors from accessing your credit file. 
# Creditors typically won't offer you credit if they can't access your credit reporting file, 
# so a security freeze, also called a credit freeze, prevents you or others from opening accounts in your name.
# This will only be shown to users in the US.
# Variables:
#   $equifaxLink (string) - a link to the Equifax website, with { -breach-checklist-link-equifax } as the label
#   $experianLink (string) - a link to the Experian website, with { -breach-checklist-link-experian } as the label
#   $transUnionLink (string) - a link to the TransUnion website, with { -breach-checklist-link-transunion } as the label
breach-checklist-ssn-body-2 = Riippuen kansalaisuudestasi ja asuinpaikastasi, voit mahdollisesti jäädyttää luottokelpoisuutesi { $equifaxLink }issa, { $experianLink }issa tai { $transUnionLink }issa estääksesi huijareita avaamasta uusia tilejä nimissäsi. Se on ilmaista eikä vaikuta luottotietoihisi.

## Prompts the user for changes when there is a breach detected of credit card

breach-checklist-cc-header = Ilmoita tästä tietovuodosta luottokorttisi myöntäjälle ja pyydä uutta korttia uudella numerolla.
breach-checklist-cc-body = Tarkista luottokorttisi tiliotteet tunnistamattomien veloitusten varalta.

## Prompts the user for changes when there is a breach detected of bank account

breach-checklist-bank-header = Ilmoita pankillesi välittömästi, että tilinumerosi on vaarantunut.
breach-checklist-bank-body = Mitä nopeammin sen teet, sitä enemmän voit saada oikeudellista suojaa, joka auttaa sinua korvaamaan tappiot. Tarkista myös, onko tililläsi tuntemattomia veloituksia.

## Prompts the user for changes when there is a breach detected of pin

breach-checklist-pin-header = Ilmoita kortin myöntäjälle ja vaihda PIN-koodi välittömästi.
breach-checklist-pin-body = Varmista, että uusi PIN-koodisi tai mikään muu PIN-koodi ei sisällä helposti arvattavia numeroita, kuten syntymäaikaasi tai osoitettasi.

## Prompts the user for changes when there is a breach detected of IP address

# Variables:
#   $mozillaVpnLink (string) - a link to the Mozilla VPN website, with { -breach-checklist-link-mozilla-vpn } as the label
breach-checklist-ip-header-2 = Käytä Internetiä yksityisesti { $mozillaVpnLink }:n kaltaisen VPN:n kautta.
breach-checklist-ip-body = IP-osoitteesi (Internet Protocol -osoite) voi kertoa tietoa sijannistasi ja Internet-palveluntarjoajastasi. VPN voi piilottaa todellisen IP-osoitteesi, jotta voit käyttää Internetiä aiempaa yksityisemmin.

## Prompts the user for changes when there is a breach detected of physical address

breach-checklist-address-header = Vaihda salasanat tai PIN-koodit, jotka sisältävät minkä tahansa osan osoitteestasi.
breach-checklist-address-body = Osoitetiedot on verrattain helppo löytää julkisista tiedoista, ja niiden avulla näitä tietoja sisältävät salasanat ja PIN-koodit on helppo arvata.

## Prompts the user for changes when there is a breach detected of date of birth

breach-checklist-dob-header = Vaihda kaikki salasanat tai PIN-koodit, jotka sisältävät syntymäaikasi.
breach-checklist-dob-body = Syntymäaika on verrattain helppo löytää julkisista tiedoista, ja sen löytäneet voivat helposti arvata PIN-koodisi.

## Prompts the user for changes when there is a breach detected of phone number

# Variables:
#   $firefoxRelayLink (string) - a link to Firefox Relay, with { -breach-checklist-link-firefox-relay } as the label
breach-checklist-phone-header-2 = Suojaa puhelinnumerosi maskipalvelulla, kuten { $firefoxRelayLink }, joka piilottaa oikean puhelinnumerosi.

## Prompts the user for changes when there is a breach detected of security questions

# { $breachedCompanyLink } will link to the website of the company where the breach occurred
breach-checklist-sq-header-2 = Päivitä turvallisuuskysymyksesi yrityksen verkkosivustolla.
breach-checklist-sq-body = Käytä pitkiä, satunnaisia vastauksia ja säilytä ne turvallisessa paikassa. Tee tämä myös muualla, missä olet käyttänyt samoja turvakysymyksiä.

## Prompts the user for changes when there is a breach detected of historical password

breach-checklist-hp-header = Luo ainutlaatuisia, vahvoja salasanoja kaikille tileille, joilla olet käyttänyt samaa salasanaa kuin jossain muussa palvelussa.
# Variables:
#   $passwordManagerLink (string) - a link to the password manager documentation, with { -breach-checklist-link-password-manager } as the label
breach-checklist-hp-body-2 = Salasanojen hallinta, kuten { $passwordManagerLink } (joka on ilmainen ja sisäänrakennettu { -brand-firefox }iin), voi auttaa sinua pitämään kirjaa kaikista salasanoistasi ja mahdollistaa niiden käyttämisen turvallisesti kaikilla laitteillasi.

## Prompts the user for changes when there is a breach detected of other types

# NOTE: { $companyName } is a placeholder for the name of the company where the breach occurred 
breach-checklist-general-header = Ota yhteys yritykseen { $companyName } kertoaksesi heille tästä tietovuodosta ja kysyäksesi, mitä voit tehdä.
