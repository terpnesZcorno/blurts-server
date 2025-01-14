# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


## Breaches header

# Data classes pie chart title
breach-chart-title = Uniknuté údaje
# $email-select is an interactive <select> element displaying the current email address
breach-heading-email = Úniky údajov pre { $email-select }
# $count is the number of emails a user has added out of $total allowed
emails-monitored =
    { $total ->
        [one] Monitorované e-maily: { $count } z { $total }
        [few] Monitorované e-maily: { $count } z { $total }
        [many] Monitorované e-maily: { $count } z { $total }
       *[other] Monitorované e-maily: { $count } z { $total }
    }
# link to Settings page where user can add/remove emails and set message preferences
manage-emails-link = Spravovať e-mailové adresy

## Breaches resolved filter

filter-label-unresolved = Nevyriešené úniky
filter-label-resolved = Vyriešené úniky

## Breaches table

column-company = SPOLOČNOSŤ
column-breached-data = UNIKNUTÉ ÚDAJE
column-detected = ZISTENÉ
# “Resolved” is shown next to a breach if all recommended actions in response to the breach have been taken.
column-status-badge-resolved = Vyriešený
# “Active” is shown next to a breach if the user still has at least one recommended action to perform in response to the breach.
column-status-badge-active = Aktívny
breaches-resolve-heading = Ako vyriešiť tento únik:
breaches-none-headline = Neboli nájdené žiadne úniky dát
# Variables:
#   $email (String) - An email address that we did not find breaches for, e.g. `someone@example.com`
breaches-none-copy = Dobré správy! Pre adresu { $email } neboli hlásené žiadne známe úniky dát. Túto adresu budeme naďalej sledovať a budeme vás informovať, ak dôjde k novým únikom.
breaches-none-cta-blurb = Chcete monitorovať ďalšiu e-mailovú adresu?
breaches-none-cta-button = Pridať e-mailovú adresu
breaches-all-resolved-headline = Všetky úniky dát vyriešené
# Variables:
#   $email (String) - An email address for which all breaches have been resolved, e.g. `someone@example.com`
breaches-all-resolved-copy = Paráda! Vyriešili ste všetky úniky dát pre adresu { $email }. Túto adresu budeme naďalej sledovať a budeme vás informovať, ak dôjde k novým únikom.
breaches-all-resolved-cta-blurb = Chcete monitorovať ďalšiu e-mailovú adresu?
breaches-all-resolved-cta-button = Pridať e-mailovú adresu
# $breachDate and $addedDate are dates that should be localized via JS DateTimeFormat(). $dataClasses is a list of strings from data-classes.ftl that should be localized via JS ListFormat()
breach-description = Dňa { $breachDate } došlo k úniku dát spoločnosti { $companyName }. Akonáhle bol únik objavený a overený, bol dňa { $addedDate } pridaný do našej databázy. Tento únik zahŕňal: { $dataClasses }

## Links that we might refer to when prompting the user to make changes after a breach

breach-checklist-link-firefox-relay = { -brand-relay }
breach-checklist-link-password-manager = Správca hesiel { -brand-firefox(case: "gen") }
breach-checklist-link-mozilla-vpn = { -brand-mozilla-vpn }

## Prompts the user for changes when there is a breach detected of password

# { $breachedCompanyLink } will link to the website of the company where the breach occurred
breach-checklist-pw-header-2 = Prejdite na webovú stránku spoločnosti, zmeňte svoje heslo a povoľte dvojstupňové overenie (2FA).
# Variables:
#   $passwordManagerLink (string) - a link to the password manager documentation, with { -breach-checklist-link-password-manager } as the label
breach-checklist-pw-body-2 = Uistite sa, že vaše heslo je jedinečné a ťažko uhádnuteľné. Ak sa toto heslo používa na viacerých účtoch, nezabudnite ho zmeniť aj tam. { $passwordManagerLink } vám môže pomôcť bezpečne organizovať všetky vaše heslá.

## Prompts the user for changes when there is a breach detected of email

# Variables:
#   $firefoxRelayLink (string) - a link to Firefox Relay, with { -breach-checklist-link-firefox-relay } as the label
breach-checklist-email-header-2 = Chráňte svoj e-mail pomocou služby maskovania e-mailov, ako je { $firefoxRelayLink }.
breach-checklist-email-body = Týmto môžete skryť vašu skutočnú e-mailovú adresu a zároveň stále dostávať e-maily do vašej skutočnej e-mailovej schránky.

## Prompts the user for changes when there is a breach detected of social security number

# Credit reports list your bill payment history, loans, current debt, and other financial information. 
# They show where you work and live and whether you've been sued, arrested, or filed for bankruptcy.
breach-checklist-ssn-header = Sledujte podozrivé pôžičky a pohyby na svojich účtoch v bankách alebo na kreditných kartách.
# A security freeze prevents prospective creditors from accessing your credit file. 
# Creditors typically won't offer you credit if they can't access your credit reporting file, 
# so a security freeze, also called a credit freeze, prevents you or others from opening accounts in your name.
# This will only be shown to users in the US.
# Variables:
#   $equifaxLink (string) - a link to the Equifax website, with { -breach-checklist-link-equifax } as the label
#   $experianLink (string) - a link to the Experian website, with { -breach-checklist-link-experian } as the label
#   $transUnionLink (string) - a link to the TransUnion website, with { -breach-checklist-link-transunion } as the label
breach-checklist-ssn-body-2 = Môžete tiež zvážiť zmrazenie svojho kreditu na { $equifaxLink }, { $experianLink } a { $transUnionLink }, aby ste zabránili podvodníkom otvárať si nové účty na vaše meno. Je to zadarmo a neovplyvní to vaše kreditné skóre.

## Prompts the user for changes when there is a breach detected of credit card

breach-checklist-cc-header = Nahláste tento únik vydavateľovi vašej kreditnej karty a požiadajte o novú kartu s novým číslom.
breach-checklist-cc-body = Mali by ste tiež skontrolovať výpisy z vašej kreditnej karty, či neobsahujú nerozpoznané poplatky.

## Prompts the user for changes when there is a breach detected of bank account

breach-checklist-bank-header = Okamžite informujte svoju banku, že číslo vášho účtu bolo prezradené.
breach-checklist-bank-body = Čím rýchlejšie tak spravíte, získate viac právnej ochrany, ktorá vám pomôže získať späť akékoľvek straty. Mali by ste tiež skontrolovať svoje účty, či nemáte nerozpoznané poplatky.

## Prompts the user for changes when there is a breach detected of pin

breach-checklist-pin-header = Upozornite vydavateľa karty a okamžite si zmeňte PIN.
breach-checklist-pin-body = Uistite sa, že váš nový kód PIN alebo akýkoľvek iný kód PIN nezahŕňa ľahko uhádnuteľné čísla, ako napríklad dátum narodenia alebo adresu.

## Prompts the user for changes when there is a breach detected of IP address

# Variables:
#   $mozillaVpnLink (string) - a link to the Mozilla VPN website, with { -breach-checklist-link-mozilla-vpn } as the label
breach-checklist-ip-header-2 = Používajte internet súkromne pomocou siete VPN, ako je napríklad { $mozillaVpnLink }.
breach-checklist-ip-body = Vaša IP adresa (Internet Protocol address) presne určuje vašu polohu a poskytovateľa internetových služieb. Sieť VPN môže skryť vašu skutočnú IP adresu, aby ste mohli používať internet súkromne.

## Prompts the user for changes when there is a breach detected of physical address

breach-checklist-address-header = Zmeňte všetky heslá alebo kódy PIN, ktoré obsahujú akúkoľvek časť vašej adresy.
breach-checklist-address-body = Adresy sa dajú ľahko nájsť vo verejných záznamoch a tieto heslá a kódy PIN sa dajú ľahko uhádnuť.

## Prompts the user for changes when there is a breach detected of date of birth

breach-checklist-dob-header = Zmeňte všetky heslá alebo kódy PIN, ktoré obsahujú váš dátum narodenia.
breach-checklist-dob-body = Dátumy narodenia sa dajú ľahko nájsť vo verejných záznamoch a ľudia, ktorí ich nájdu, môžu ľahko uhádnuť váš PIN.

## Prompts the user for changes when there is a breach detected of phone number

# Variables:
#   $firefoxRelayLink (string) - a link to Firefox Relay, with { -breach-checklist-link-firefox-relay } as the label
breach-checklist-phone-header-2 = Chráňte svoje telefónne číslo pomocou maskovacej služby, ako je { $firefoxRelayLink }, ktorá skryje vaše skutočné telefónne číslo.

## Prompts the user for changes when there is a breach detected of security questions

# { $breachedCompanyLink } will link to the website of the company where the breach occurred
breach-checklist-sq-header-2 = Aktualizujte svoje bezpečnostné otázky na webovej stránke spoločnosti.
breach-checklist-sq-body = Použite dlhé, náhodné odpovede a uložte ich na bezpečné miesto. Urobte to kdekoľvek inde, kde ste použili rovnaké bezpečnostné otázky.

## Prompts the user for changes when there is a breach detected of historical password

breach-checklist-hp-header = Vytvorte jedinečné a silné heslá pre každý účet, v ktorom ste použili kompromitované heslo.
# Variables:
#   $passwordManagerLink (string) - a link to the password manager documentation, with { -breach-checklist-link-password-manager } as the label
breach-checklist-hp-body-2 = Správca hesiel, ako je { $passwordManagerLink } (ktorý je bezplatný a zabudovaný do prehliadača { -brand-firefox }), vám môže pomôcť sledovať všetky vaše heslá a pristupovať k nim bezpečne zo všetkých vašich zariadení.

## Prompts the user for changes when there is a breach detected of other types

# NOTE: { $companyName } is a placeholder for the name of the company where the breach occurred 
breach-checklist-general-header = Obráťte sa na { $companyName }, informujte ich o tomto porušení a požiadajte o konkrétne kroky, ktoré môžete podniknúť.
