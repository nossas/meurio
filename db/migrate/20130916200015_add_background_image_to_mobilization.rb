class AddBackgroundImageToMobilization < ActiveRecord::Migration
  def change
    add_column :mobilizations, :background_image, :string
  end
end
