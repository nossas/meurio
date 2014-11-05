class AddHashtagToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :hashtag, :string
  end
end
