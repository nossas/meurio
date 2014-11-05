class AddCreatedAtToPanelaPoke < ActiveRecord::Migration
  def change
    add_column :panela_pokes, :created_at, :datetime
  end
end
