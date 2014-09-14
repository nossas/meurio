class CreateCompartilhacoCampaignSpreaders < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        CREATE FOREIGN TABLE compartilhaco_campaign_spreaders(id integer)
        SERVER compartilhaco
        OPTIONS (table_name 'campaign_spreaders');
      SQL
    else
      create_table :compartilhaco_campaign_spreaders
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE compartilhaco_campaign_spreaders;"
    else
      execute "DROP TABLE compartilhaco_campaign_spreaders;"
    end
  end
end
