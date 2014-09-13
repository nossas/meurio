class AddServerCompartilhaco < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      raise "COMPARTILHACO_DBNAME is missing" if ENV["COMPARTILHACO_DBNAME"].nil?
      raise "COMPARTILHACO_DBHOST is missing" if ENV["COMPARTILHACO_DBHOST"].nil?
      raise "COMPARTILHACO_DBUSER is missing" if ENV["COMPARTILHACO_DBUSER"].nil?
      raise "COMPARTILHACO_DBPASS is missing" if ENV["COMPARTILHACO_DBPASS"].nil?
      execute "CREATE EXTENSION postgres_fdw;"
      execute "CREATE SERVER compartilhaco FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname '#{ENV["COMPARTILHACO_DBNAME"]}', host '#{ENV["COMPARTILHACO_DBHOST"]}');"
      execute "CREATE USER MAPPING for #{ENV["DB_USERNAME"]} SERVER compartilhaco OPTIONS (user '#{ENV["COMPARTILHACO_DBUSER"]}', password '#{ENV["COMPARTILHACO_DBPASS"]}');"
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP EXTENSION postgres_fdw CASCADE;"
    end
  end
end
