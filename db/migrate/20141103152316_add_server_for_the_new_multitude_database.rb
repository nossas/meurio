class AddServerForTheNewMultitudeDatabase < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      raise "MULTITUDE_DBNAME is missing" if ENV["MULTITUDE_DBNAME"].nil?
      raise "MULTITUDE_DBHOST is missing" if ENV["MULTITUDE_DBHOST"].nil?
      raise "MULTITUDE_DBUSER is missing" if ENV["MULTITUDE_DBUSER"].nil?
      raise "MULTITUDE_DBPASS is missing" if ENV["MULTITUDE_DBPASS"].nil?
      execute "ALTER SERVER multitude OPTIONS (SET dbname '#{ENV["MULTITUDE_DBNAME"]}', host '#{ENV["MULTITUDE_DBHOST"]}');"
      execute "ALTER USER MAPPING FOR #{ENV["DB_USERNAME"]} SERVER multitude OPTIONS (SET user '#{ENV["MULTITUDE_DBUSER"]}', password '#{ENV["MULTITUDE_DBPASS"]}');"
    end
  end

  def down
  end
end
