class AddHashtagToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :hashtag, :string
  end
end
