# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


## Breaches header

# Data classes pie chart title
breach-chart-title = Скомпрометированные данные
# $email-select is an interactive <select> element displaying the current email address
breach-heading-email = Утечки данных для { $email-select }
# $count is the number of emails a user has added out of $total allowed
emails-monitored =
    { $total ->
        [one] { $count } из { $total } отслеживаемого письма
        [few] { $count } из { $total } отслеживаемых писем
        [many] { $count } из { $total } отслеживаемых писем
       *[other] { $count } из { $total } отслеживаемых писем
    }
# link to Settings page where user can add/remove emails and set message preferences
manage-emails-link = Управление электронными почтовыми адресами

## Breaches resolved filter

filter-label-unresolved = Необработанные утечки
filter-label-resolved = Обработанные утечки

## Breaches table

column-company = КОМПАНИЯ
column-breached-data = УТЕКШИЕ ДАННЫЕ
column-detected = ОБНАРУЖЕНА
# “Resolved” is shown next to a breach if all recommended actions in response to the breach have been taken.
column-status-badge-resolved = Решена
# “Active” is shown next to a breach if the user still has at least one recommended action to perform in response to the breach.
column-status-badge-active = Активна
breaches-resolve-heading = Решить эту утечку:
breaches-none-headline = Утечек не обнаружено
# Variables:
#   $email (String) - An email address that we did not find breaches for, e.g. `someone@example.com`
breaches-none-copy = Хорошие новости! Для { $email } не было зарегистрировано никаких известных утечках. Мы будем продолжать отслеживать эту почту и сообщим вам, если появятся новые утечки.
breaches-none-cta-blurb = Хотите ли вы отслеживать другую электронную почту?
breaches-none-cta-button = Добавить адрес электронной почты
breaches-all-resolved-headline = Все утечки устранены
# Variables:
#   $email (String) - An email address for which all breaches have been resolved, e.g. `someone@example.com`
breaches-all-resolved-copy = Отлично сделано! Вы устранили все утечки для { $email }. Мы продолжим отслеживать электронную почту и сообщим вам, если возникнут новые утечки.
breaches-all-resolved-cta-blurb = Хотите ли вы отслеживать другую электронную почту?
breaches-all-resolved-cta-button = Добавить адрес электронной почты
# $breachDate and $addedDate are dates that should be localized via JS DateTimeFormat(). $dataClasses is a list of strings from data-classes.ftl that should be localized via JS ListFormat()
breach-description = { $breachDate } произошла утечка данных { $companyName }. Как только утечка была обнаружена и подтверждена, она была добавлена в нашу базу данных { $addedDate }. Эта утечка включает в себя: { $dataClasses }

## Links that we might refer to when prompting the user to make changes after a breach

breach-checklist-link-firefox-relay = { -brand-relay }
breach-checklist-link-password-manager = Менеджер паролей { -brand-firefox }
breach-checklist-link-mozilla-vpn = { -brand-mozilla-vpn }

## Prompts the user for changes when there is a breach detected of password

# { $breachedCompanyLink } will link to the website of the company where the breach occurred
breach-checklist-pw-header-2 = Перейдите на сайт компании, чтобы сменить пароль и включить двухфакторную аутентификацию (2FA).
# Variables:
#   $passwordManagerLink (string) - a link to the password manager documentation, with { -breach-checklist-link-password-manager } as the label
breach-checklist-pw-body-2 = Убедитесь, что ваш пароль уникален и его трудно угадать. Если этот пароль используется в каких-либо других учётных записях, обязательно измените его и там. { $passwordManagerLink } поможет вам надежно отслеживать все ваши пароли.

## Prompts the user for changes when there is a breach detected of email

# Variables:
#   $firefoxRelayLink (string) - a link to Firefox Relay, with { -breach-checklist-link-firefox-relay } as the label
breach-checklist-email-header-2 = Защитите свою электронную почту с помощью сервиса маскирования электронной почты, например, { $firefoxRelayLink }.
breach-checklist-email-body = Это может скрыть ваш настоящий адрес электронной почты при пересылке писем на ваш настоящий почтовый ящик.

## Prompts the user for changes when there is a breach detected of social security number

# Credit reports list your bill payment history, loans, current debt, and other financial information. 
# They show where you work and live and whether you've been sued, arrested, or filed for bankruptcy.
breach-checklist-ssn-header = Следите за своим кредитной историей на предмет появления в ней счетов, кредитов или кредитных карт, о которых не знаете.
# A security freeze prevents prospective creditors from accessing your credit file. 
# Creditors typically won't offer you credit if they can't access your credit reporting file, 
# so a security freeze, also called a credit freeze, prevents you or others from opening accounts in your name.
# This will only be shown to users in the US.
# Variables:
#   $equifaxLink (string) - a link to the Equifax website, with { -breach-checklist-link-equifax } as the label
#   $experianLink (string) - a link to the Experian website, with { -breach-checklist-link-experian } as the label
#   $transUnionLink (string) - a link to the TransUnion website, with { -breach-checklist-link-transunion } as the label
breach-checklist-ssn-body-2 = Вы также можете подумать о заморозке своей записи кредитной истории в { $equifaxLink }, { $experianLink } и { $transUnionLink }, чтобы мошенники не смогли открыть новые счета на ваше имя. Это бесплатно и не повлияет на ваш кредитный рейтинг.

## Prompts the user for changes when there is a breach detected of credit card

breach-checklist-cc-header = Сообщите об этой утечке эмитенту вашей кредитной карты и запросите новую карту с новым номером.
breach-checklist-cc-body = Вам также следует просмотреть выписки по кредитной карте на предмет неопознанных списаний.

## Prompts the user for changes when there is a breach detected of bank account

breach-checklist-bank-header = Немедленно сообщите в свой банк, что номер вашего счета был скомпрометирован.
breach-checklist-bank-body = Если вы сделаете это быстрее, у вас будет больше правовой защиты, которая поможет вам возместить любые убытки. Вы также захотите проверить свои счета на наличие неопознанных списаний.

## Prompts the user for changes when there is a breach detected of pin

breach-checklist-pin-header = Сообщите эмитенту вашей карты и немедленно измените свой PIN-код.
breach-checklist-pin-body = Убедитесь, что ваш новый PIN-код или любой другой PIN-код не содержит легко угадываемых чисел, таких как дата вашего рождения или адрес.

## Prompts the user for changes when there is a breach detected of IP address

# Variables:
#   $mozillaVpnLink (string) - a link to the Mozilla VPN website, with { -breach-checklist-link-mozilla-vpn } as the label
breach-checklist-ip-header-2 = Используйте Интернет конфиденциально с помощью VPN, например, с помощью { $mozillaVpnLink }.
breach-checklist-ip-body = Ваш IP-адрес (адрес интернет-протокола) показывает ваше местоположение и интернет-провайдера. VPN поможет скрыть ваш настоящий IP-адрес, чтобы вы могли пользоваться Интернетом конфиденциально.

## Prompts the user for changes when there is a breach detected of physical address

breach-checklist-address-header = Измените любые пароли или PIN-коды, содержащие любую часть вашего адреса.
breach-checklist-address-body = Адреса легко найти в общедоступных записях, и такие пароли и PIN-коды могут быть легко угаданы.

## Prompts the user for changes when there is a breach detected of date of birth

breach-checklist-dob-header = Измените любые пароли или PIN-коды, содержащие дату вашего рождения.
breach-checklist-dob-body = Дату рождения легко найти в общедоступных записях, и люди, которые найдут её, могут легко угадать ваш PIN-код.

## Prompts the user for changes when there is a breach detected of phone number

# Variables:
#   $firefoxRelayLink (string) - a link to Firefox Relay, with { -breach-checklist-link-firefox-relay } as the label
breach-checklist-phone-header-2 = Защитите свой номер телефона с помощью сервиса маскирования, например, с помощью { $firefoxRelayLink }, который скрывает ваш настоящий номер телефона.

## Prompts the user for changes when there is a breach detected of security questions

# { $breachedCompanyLink } will link to the website of the company where the breach occurred
breach-checklist-sq-header-2 = Обновите свои контрольные вопросы на сайте компании.
breach-checklist-sq-body = Используйте длинные случайные ответы и храните их в безопасном месте. Делайте это в любом другом месте, отличном от того, что вы использовали для тех же контрольных вопросов.

## Prompts the user for changes when there is a breach detected of historical password

breach-checklist-hp-header = Создавайте уникальные надежные пароли для любой учетной записи, в которой вы повторно использовали пароли.
# Variables:
#   $passwordManagerLink (string) - a link to the password manager documentation, with { -breach-checklist-link-password-manager } as the label
breach-checklist-hp-body-2 = Менеджер паролей, например, { $passwordManagerLink } (бесплатный и встроенный в браузер { -brand-firefox }), может помочь вам отслеживать все ваши пароли и безопасно получать к ним доступ со всех ваших устройств.

## Prompts the user for changes when there is a breach detected of other types

# NOTE: { $companyName } is a placeholder for the name of the company where the breach occurred 
breach-checklist-general-header = Свяжитесь с { $companyName }, чтобы сообщить им об этой утечке и запросить конкретные шаги, которые вы можете предпринять.
