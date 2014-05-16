class AddServerFacaacontecer < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      raise "FACA_ACONTECER_DBNAME is missing" if ENV["FACA_ACONTECER_DBNAME"].nil?
      raise "FACA_ACONTECER_DBHOST is missing" if ENV["FACA_ACONTECER_DBHOST"].nil?
      raise "FACA_ACONTECER_DBUSER is missing" if ENV["FACA_ACONTECER_DBUSER"].nil?
      raise "FACA_ACONTECER_DBPASS is missing" if ENV["FACA_ACONTECER_DBPASS"].nil?
      raise "DB_USERNAME is missing" if ENV["DB_USERNAME"].nil?

      execute <<-SQL
      CREATE SERVER facaacontecer
      FOREIGN DATA WRAPPER postgres_fdw
      OPTIONS (dbname '#{ENV["FACA_ACONTECER_DBNAME"]}', host '#{ENV["FACA_ACONTECER_DBHOST"]}');
      CREATE USER MAPPING for #{ENV["DB_USERNAME"]}
      SERVER facaacontecer
      OPTIONS (user '#{ENV["FACA_ACONTECER_DBUSER"]}', password '#{ENV["FACA_ACONTECER_DBPASS"]}');
      SQL
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      raise "DB_USERNAME is missing" if ENV["DB_USERNAME"].nil?

      execute <<-SQL
      DROP SERVER facaacontecer
      DROP USER MAPPING FOR #{ENV["DB_USERNAME"]} SERVER facaacontecer
      SQL
    end
  end
end
