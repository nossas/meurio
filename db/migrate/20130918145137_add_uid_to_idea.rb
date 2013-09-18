class AddUidToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :uid, :string
  end
end
