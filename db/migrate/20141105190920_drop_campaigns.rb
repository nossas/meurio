class DropCampaigns < ActiveRecord::Migration
  def up
    drop_table :campaigns
  end

  def down
    create_table :campaigns do |t|
      t.string :name
      t.string :link
      t.text :description
      t.integer :mobilization_id

      t.timestamps
    end
  end
end
