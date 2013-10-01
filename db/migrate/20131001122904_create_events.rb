class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :hashtag
      t.integer :attending_count

      t.timestamps
    end
  end
end
