class CreatePokes < ActiveRecord::Migration
  def change
    create_table :pokes do |t|

      t.timestamps
    end
  end
end
