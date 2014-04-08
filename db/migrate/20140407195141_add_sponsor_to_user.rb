class AddSponsorToUser < ActiveRecord::Migration
  def change
    add_column :users, :sponsor, :boolean, default: false
  end
end
