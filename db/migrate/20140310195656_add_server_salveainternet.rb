class AddServerSalveainternet < ActiveRecord::Migration
  def change
    if Rails.env.production? || Rails.env.staging?
      raise "SALVEAINTERNET_DBNAME is missing" if ENV["SALVEAINTERNET_DBNAME"].nil?
      raise "SALVEAINTERNET_DBHOST is missing" if ENV["SALVEAINTERNET_DBHOST"].nil?
      raise "SALVEAINTERNET_DBUSER is missing" if ENV["SALVEAINTERNET_DBUSER"].nil?
      raise "SALVEAINTERNET_DBPASS is missing" if ENV["SALVEAINTERNET_DBPASS"].nil?
      raise "DB_USERNAME is missing" if ENV["DB_USERNAME"].nil?
      execute "CREATE SERVER salveainternet FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname '#{ENV["SALVEAINTERNET_DBNAME"]}', host '#{ENV["SALVEAINTERNET_DBHOST"]}');"
      execute "CREATE USER MAPPING for #{ENV["DB_USERNAME"]} SERVER salveainternet OPTIONS (user '#{ENV["SALVEAINTERNET_DBUSER"]}', password '#{ENV["SALVEAINTERNET_DBPASS"]}');"
    end
  end
end
