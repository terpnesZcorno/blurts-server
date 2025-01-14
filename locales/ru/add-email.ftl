# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


### Dialog window that allows a user to add a new email address to be monitored

add-email-add-another-heading = Добавить другой адрес электронной почты
# $total is the number of emails a user is allowed to add
add-email-your-account-includes =
    { $total ->
        [one] Ваш аккаунт включает мониторинг { $total } адреса электронной почты. Добавьте новый адрес электронной почты, чтобы узнать, был ли он затронут утечкой.
        [few] Ваш аккаунт включает мониторинг { $total } адресов электронной почты. Добавьте новый адрес электронной почты, чтобы узнать, был ли он затронут утечкой.
        [many] Ваш аккаунт включает мониторинг { $total } адресов электронной почты. Добавьте новый адрес электронной почты, чтобы узнать, был ли он затронут утечкой.
       *[other] Ваш аккаунт включает мониторинг { $total } адресов электронной почты. Добавьте новый адрес электронной почты, чтобы узнать, был ли он затронут утечкой.
    }
add-email-address-input-label = Адрес электронной почты
add-email-send-verification-button = Отправить ссылку для подтверждения
# $email is the newly added email address. $settings-href is the URL for the Settings page. HTML tags should not be translated, e.g. `<a>`
add-email-verify-the-link = Проверьте ссылку, отправленную на { $email }, чтобы добавить его в { -brand-fx-monitor }. Управляйте всеми адресами электронной почты в <a { $settings-href }>Настройках</a>.
