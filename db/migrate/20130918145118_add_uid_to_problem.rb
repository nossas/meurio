class AddUidToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :uid, :string
  end
end
