class AddDescriptionHtmlToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :description_html, :string
  end
end
