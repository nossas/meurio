class AddServerMeurioAccounts < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      raise "MEURIO_ACCOUNTS_DBNAME is missing" if ENV["MEURIO_ACCOUNTS_DBNAME"].nil?
      raise "MEURIO_ACCOUNTS_DBHOST is missing" if ENV["MEURIO_ACCOUNTS_DBHOST"].nil?
      raise "MEURIO_ACCOUNTS_DBUSER is missing" if ENV["MEURIO_ACCOUNTS_DBUSER"].nil?
      raise "MEURIO_ACCOUNTS_DBPASS is missing" if ENV["MEURIO_ACCOUNTS_DBPASS"].nil?
      raise "DB_USERNAME is missing" if ENV["DB_USERNAME"].nil?
      execute "CREATE SERVER meurio_accounts FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname '#{ENV["MEURIO_ACCOUNTS_DBNAME"]}', host '#{ENV["MEURIO_ACCOUNTS_DBHOST"]}');"
      execute "CREATE USER MAPPING for #{ENV["DB_USERNAME"]} SERVER meurio_accounts OPTIONS (user '#{ENV["MEURIO_ACCOUNTS_DBUSER"]}', password '#{ENV["MEURIO_ACCOUNTS_DBPASS"]}');"
    end
  end

  def down
  end
end
