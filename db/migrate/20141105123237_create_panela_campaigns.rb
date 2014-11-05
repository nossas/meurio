class CreatePanelaCampaigns < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        CREATE FOREIGN TABLE panela_campaigns(id integer)
        SERVER panela
        OPTIONS (table_name 'campaigns');
      SQL
    else
      create_table :panela_campaigns
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE panela_campaigns;"
    else
      execute "DROP TABLE panela_campaigns;"
    end
  end
end
