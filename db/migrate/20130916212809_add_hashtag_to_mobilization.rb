class AddHashtagToMobilization < ActiveRecord::Migration
  def change
    add_column :mobilizations, :hashtag, :string
  end
end
