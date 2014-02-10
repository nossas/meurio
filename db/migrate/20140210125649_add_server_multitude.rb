class AddServerMultitude < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      raise "MULTITUDE_DBNAME is missing" if ENV["MULTITUDE_DBNAME"].nil?
      raise "MULTITUDE_DBHOST is missing" if ENV["MULTITUDE_DBHOST"].nil?
      raise "MULTITUDE_DBUSER is missing" if ENV["MULTITUDE_DBUSER"].nil?
      raise "MULTITUDE_DBPASS is missing" if ENV["MULTITUDE_DBPASS"].nil?
      execute "CREATE EXTENSION postgres_fdw;"
      execute "CREATE SERVER multitude FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname '#{ENV["MULTITUDE_DBNAME"]}', host '#{ENV["MULTITUDE_DBHOST"]}');"
      execute "CREATE USER MAPPING for #{ENV["DB_USERNAME"]} SERVER multitude OPTIONS (user '#{ENV["MULTITUDE_DBUSER"]}', password '#{ENV["MULTITUDE_DBPASS"]}');"
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP EXTENSION postgres_fdw CASCADE;"
    end
  end
end
