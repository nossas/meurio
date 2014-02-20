if Rails.env.test?
  ENV["MEURIO_ACCOUNTS_URL"] = "/meurio_accounts"
end
