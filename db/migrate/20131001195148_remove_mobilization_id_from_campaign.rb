class RemoveMobilizationIdFromCampaign < ActiveRecord::Migration
  def change
    remove_column :campaigns, :mobilization_id, :integer
  end
end
