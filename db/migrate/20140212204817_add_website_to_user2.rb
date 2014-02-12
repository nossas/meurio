class AddWebsiteToUser2 < ActiveRecord::Migration
  def change
    add_column :users, :website, :string
  end
end
