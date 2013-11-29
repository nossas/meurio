class AddThumbnailToMobilization < ActiveRecord::Migration
  def change
    add_column :mobilizations, :thumbnail, :string
  end
end
