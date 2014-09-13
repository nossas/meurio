class AddHashtagToCompartilhacoCampaign < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaigns, :hashtag, :string
  end
end
