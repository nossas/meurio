class AddUserEmailToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :user_email, :string
  end
end
