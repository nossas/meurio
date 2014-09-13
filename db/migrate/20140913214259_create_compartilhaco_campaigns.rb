class CreateCompartilhacoCampaigns < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <-SQL
        CREATE FOREIGN TABLE compartilhaco_campaigns(id integer)
        SERVER compartilhaco
        OPTIONS (table_name 'campaigns');
      SQL
    else
      create_table :compartilhaco_campaigns
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE compartilhaco_campaigns;"
    else
      execute "DROP TABLE compartilhaco_campaigns;"
    end
  end
end
