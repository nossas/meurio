class AddUidToPokes < ActiveRecord::Migration
  def change
    add_column :pokes, :uid, :string
  end
end
