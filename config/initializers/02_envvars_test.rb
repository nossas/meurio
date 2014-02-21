if Rails.env.test?
  ENV["MEURIO_ACCOUNTS_URL"] = "/meurio_accounts"
  ENV["API_TOKEN"] = "123"
end
