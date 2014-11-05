class DropPokes < ActiveRecord::Migration
  def up
    drop_table :pokes
  end

  def down
    create_table :pokes do |t|

      t.timestamps
    end
  end
end
