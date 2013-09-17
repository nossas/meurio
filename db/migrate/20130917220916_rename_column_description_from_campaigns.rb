class RenameColumnDescriptionFromCampaigns < ActiveRecord::Migration
  def up
    rename_column :campaigns, :description, :description_html
  end

  def down
    rename_column :campaigns, :description_html, :description
  end
end
