if Rails.env.test?
  ENV["MEURIO_ACCOUNTS_URL"] = "http://127.0.0.1/meurio_accounts"
end
