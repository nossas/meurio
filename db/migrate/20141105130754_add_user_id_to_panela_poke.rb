class AddUserIdToPanelaPoke < ActiveRecord::Migration
  def change
    add_column :panela_pokes, :user_id, :integer, foreign_key: false
  end
end
