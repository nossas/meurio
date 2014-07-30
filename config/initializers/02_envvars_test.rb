if Rails.env.test?
  ENV["MEURIO_ACCOUNTS_URL"] = "/meurio_accounts"
  ENV["CAS_SERVER_URL"] = "/meurio_accounts"
  ENV["API_TOKEN"] = "123"
end
