class AddShareCountToImages < ActiveRecord::Migration
  def change
    add_column :images, :share_count, :integer
  end
end
