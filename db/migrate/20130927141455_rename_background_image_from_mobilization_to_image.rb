class RenameBackgroundImageFromMobilizationToImage < ActiveRecord::Migration
  def change
    rename_column :mobilizations, :background_image, :image
  end
end
