class ReCreateDeliveries < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "CREATE FOREIGN TABLE deliveries() SERVER multitude OPTIONS (table_name 'deliveries');"
    else
      execute "CREATE TABLE IF NOT EXISTS deliveries();"
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE deliveries;"
    else
      drop_table :deliveries
    end
  end
end
