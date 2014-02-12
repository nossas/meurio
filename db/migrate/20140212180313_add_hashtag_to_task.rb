class AddHashtagToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :hashtag, :string
  end
end
