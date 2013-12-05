class AddLikeCountToImages < ActiveRecord::Migration
  def change
    add_column :images, :like_count, :integer
  end
end
