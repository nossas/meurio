# Be sure to restart your server when you modify this file.

if Rails.env.production?
  Meurio::Application.config.session_store :cookie_store, key: '_meurio_accounts_session', domain: 'meurio.org.br'
else
  Meurio::Application.config.session_store :cookie_store, key: '_meurio_accounts_session'
end
