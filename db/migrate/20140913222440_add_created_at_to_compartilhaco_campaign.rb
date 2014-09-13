class AddCreatedAtToCompartilhacoCampaign < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaigns, :created_at, :datetime
  end
end
