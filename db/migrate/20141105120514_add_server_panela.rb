class AddServerPanela < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      raise "PANELA_DBNAME is missing" if ENV["PANELA_DBNAME"].nil?
      raise "PANELA_DBHOST is missing" if ENV["PANELA_DBHOST"].nil?
      raise "PANELA_DBUSER is missing" if ENV["PANELA_DBUSER"].nil?
      raise "PANELA_DBPASS is missing" if ENV["PANELA_DBPASS"].nil?
      execute <<-SQL
        CREATE EXTENSION IF NOT EXISTS postgres_fdw;
        CREATE SERVER panela FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname '#{ENV["PANELA_DBNAME"]}', host '#{ENV["PANELA_DBHOST"]}');
        CREATE USER MAPPING for #{ENV["DB_USERNAME"]} SERVER panela OPTIONS (user '#{ENV["PANELA_DBUSER"]}', password '#{ENV["PANELA_DBPASS"]}');
      SQL
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        DROP SERVER IF EXISTS panela;
        DROP USER MAPPING IF EXISTS FOR #{ENV["DB_USERNAME"]} SERVER panela;
      SQL
    end
  end
end
