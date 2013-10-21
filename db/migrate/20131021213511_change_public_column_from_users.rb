class ChangePublicColumnFromUsers < ActiveRecord::Migration
  def up
    change_column :users, :public, :boolean, default: true
  end
  
  def down
    change_column :users, :public, :boolean
  end
end
