# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


## Breaches header

# Data classes pie chart title
breach-chart-title = Uniklá data
# $email-select is an interactive <select> element displaying the current email address
breach-heading-email = Únik dat pro { $email-select }
# $count is the number of emails a user has added out of $total allowed
emails-monitored =
    { $total ->
        [one] { $count } z { $total } sledovaných e-mailů
        [few] { $count } ze { $total } sledovaných e-mailů
        [many] { $count } z { $total } sledovaných e-mailů
       *[other] { $count } z { $total } sledovaných e-mailů
    }
# link to Settings page where user can add/remove emails and set message preferences
manage-emails-link = Spravovat e-mailové adresy

## Breaches resolved filter

filter-label-unresolved = Nevyřešené úniky
filter-label-resolved = Vyřešené úniky

## Breaches table

column-company = SPOLEČNOST
column-breached-data = ÚNIKLÁ DATA
column-detected = ZJIŠTĚNO
# “Resolved” is shown next to a breach if all recommended actions in response to the breach have been taken.
column-status-badge-resolved = Vyřešený
# “Active” is shown next to a breach if the user still has at least one recommended action to perform in response to the breach.
column-status-badge-active = Aktivní
breaches-resolve-heading = Vyřešit tento únik:
breaches-none-headline = Nebyly nalezeny žádné úniky dat
# Variables:
#   $email (String) - An email address that we did not find breaches for, e.g. `someone@example.com`
breaches-none-copy = Dobré zprávy! Pro adresu { $email } nebyly hlášeny žádné známé úniky dat. Tuto adresu budeme nadále monitorovat a dojde-li k novému úniku dat, dáme vám vědět.
breaches-none-cta-blurb = Chcete monitorovat další e-mailovou adresu?
breaches-none-cta-button = Přidat e-mailové adresy
breaches-all-resolved-headline = Všechny úniky dát byly vyřešeny
# Variables:
#   $email (String) - An email address for which all breaches have been resolved, e.g. `someone@example.com`
breaches-all-resolved-copy = Výborně! Vyřešili jste všechny úniky dat pro adresu { $email }. Tuto adresu budeme nadále monitorovat a dojde-li k novému úniku dat, dáme vám vědět.
breaches-all-resolved-cta-blurb = Chcete monitorovat další e-mailovou adresu?
breaches-all-resolved-cta-button = Přidat e-mailové adresy
# $breachDate and $addedDate are dates that should be localized via JS DateTimeFormat(). $dataClasses is a list of strings from data-classes.ftl that should be localized via JS ListFormat()
breach-description = Dne { $breachDate } došlo k úniku dat společnosti { $companyName }. Jakmile byl únik objevený a ověřený, byl dne { $addedDate } přidán do naší databáze. Tento únik zahrnoval: { $dataClasses }

## Links that we might refer to when prompting the user to make changes after a breach

breach-checklist-link-firefox-relay = { -brand-relay }
breach-checklist-link-password-manager = Správce hesel { -brand-firefox(case: "gen") }
breach-checklist-link-mozilla-vpn = { -brand-mozilla-vpn }

## Prompts the user for changes when there is a breach detected of password

# { $breachedCompanyLink } will link to the website of the company where the breach occurred
breach-checklist-pw-header-2 = Přejděte na web společnosti, změňte si heslo a povolte dvoufázové ověřování (2FA).
# Variables:
#   $passwordManagerLink (string) - a link to the password manager documentation, with { -breach-checklist-link-password-manager } as the label
breach-checklist-pw-body-2 = Ujistěte se, že vaše heslo je unikátní a obtížně uhodnutelné. Pokud je toto heslo použito u více účtů, nezapomeňte ho změnit i tam. { $passwordManagerLink } vám může pomoci bezpečně spravovat všechna vaše hesla.

## Prompts the user for changes when there is a breach detected of email

# Variables:
#   $firefoxRelayLink (string) - a link to Firefox Relay, with { -breach-checklist-link-firefox-relay } as the label
breach-checklist-email-header-2 = Chraňte svůj e-mail pomocí služby maskování e-mailu jako je { $firefoxRelayLink }.
breach-checklist-email-body = Tímto můžete skrýt svou skutečnou e-mailovou adresu a zároveň stále dostávat e-maily do své reálné e-mailové schránky.

## Prompts the user for changes when there is a breach detected of social security number

# Credit reports list your bill payment history, loans, current debt, and other financial information. 
# They show where you work and live and whether you've been sued, arrested, or filed for bankruptcy.
breach-checklist-ssn-header = Sledujte podezřelé položky a pohyby na svých účtech v bance nebo na platební kartách.
# A security freeze prevents prospective creditors from accessing your credit file. 
# Creditors typically won't offer you credit if they can't access your credit reporting file, 
# so a security freeze, also called a credit freeze, prevents you or others from opening accounts in your name.
# This will only be shown to users in the US.
# Variables:
#   $equifaxLink (string) - a link to the Equifax website, with { -breach-checklist-link-equifax } as the label
#   $experianLink (string) - a link to the Experian website, with { -breach-checklist-link-experian } as the label
#   $transUnionLink (string) - a link to the TransUnion website, with { -breach-checklist-link-transunion } as the label
breach-checklist-ssn-body-2 = Můžete také zvážit zmrazení svého kreditu u společností { $equifaxLink }, { $experianLink } a { $transUnionLink }, abyste zabránili podvodníkům v otevírání nových účtů na vaše jméno. Je to zdarma a neovlivní to vaše kreditní skóre.

## Prompts the user for changes when there is a breach detected of credit card

breach-checklist-cc-header = Nahlaste tento únik vydavateli své platební karty a požádejte o novou kartu s novým číslem.
breach-checklist-cc-body = Měli byste též zkontrolovat výpisy ze své platební karty, zda neobsahují neznámé platby.

## Prompts the user for changes when there is a breach detected of bank account

breach-checklist-bank-header = Okamžitě informujte svou banku, že číslo vašeho účtu bylo prozrazeno.
breach-checklist-bank-body = Pokud tak učiníte rychleji, můžete získat více právní ochrany, která vám pomůže získat zpět jakékoli ztráty. Zkontrolujte také, zda vaše účty neobsahují nerozpoznané platby.

## Prompts the user for changes when there is a breach detected of pin

breach-checklist-pin-header = Upozorněte vydavatele své karty a okamžitě si změňte PIN.
breach-checklist-pin-body = Ujistěte se, že váš nový PIN nebo jakýkoli jiný PIN neobsahuje snadno uhodnutelná čísla, jako je vaše datum narození nebo adresa.

## Prompts the user for changes when there is a breach detected of IP address

# Variables:
#   $mozillaVpnLink (string) - a link to the Mozilla VPN website, with { -breach-checklist-link-mozilla-vpn } as the label
breach-checklist-ip-header-2 = Používejte internet soukromě pomocí sítě VPN, jako je třeba { $mozillaVpnLink }.
breach-checklist-ip-body = Vaše IP adresa (adresa internetového protokolu) přesně určuje vaši polohu a poskytovatele internetových služeb. VPN může skrýt vaši skutečnou IP adresu, abyste mohli používat internet soukromě.

## Prompts the user for changes when there is a breach detected of physical address

breach-checklist-address-header = Změňte všechna hesla nebo kódy PIN, které obsahují jakoukoli část vaší adresy.
breach-checklist-address-body = Adresy lze snadno najít ve veřejných záznamech a díky nim lze tato hesla a PINy snadno uhodnout.

## Prompts the user for changes when there is a breach detected of date of birth

breach-checklist-dob-header = Změňte všechna hesla nebo kódy PIN, které obsahují vaše datum narození.
breach-checklist-dob-body = Data narození lze snadno najít ve veřejných záznamech a lidé, kteří je najdou, mohou snadno uhodnout váš PIN.

## Prompts the user for changes when there is a breach detected of phone number

# Variables:
#   $firefoxRelayLink (string) - a link to Firefox Relay, with { -breach-checklist-link-firefox-relay } as the label
breach-checklist-phone-header-2 = Chraňte své telefonní číslo pomocí maskovací služby jako { $firefoxRelayLink }, která skryje vaše skutečné telefonní číslo.

## Prompts the user for changes when there is a breach detected of security questions

# { $breachedCompanyLink } will link to the website of the company where the breach occurred
breach-checklist-sq-header-2 = Aktualizujte své bezpečnostní otázky na webových stránkách společnosti.
breach-checklist-sq-body = Použijte dlouhé, náhodné odpovědi a uložte je na bezpečném místě. Udělejte to i všude tam, kde jste použili stejné bezpečnostní otázky.

## Prompts the user for changes when there is a breach detected of historical password

breach-checklist-hp-header = Vytvořte jedinečná, silná hesla pro jakýkoli účet, kde jste hesla znovu použili.
# Variables:
#   $passwordManagerLink (string) - a link to the password manager documentation, with { -breach-checklist-link-password-manager } as the label
breach-checklist-hp-body-2 = Správce hesel jako { $passwordManagerLink } (který je zdarma a vestavěný do prohlížeče { -brand-firefox }) vám může pomoci sledovat všechna vaše hesla a mít k nim bezpečný přístup ze všech vašich zařízení.

## Prompts the user for changes when there is a breach detected of other types

# NOTE: { $companyName } is a placeholder for the name of the company where the breach occurred 
breach-checklist-general-header = Obraťte se na společnost { $companyName }, informujte je o tomto úniku a požádejte je o konkrétní kroky, které můžete podniknout.
