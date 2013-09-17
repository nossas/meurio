class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :link
      t.text :description
      t.references :mobilization, index: true

      t.timestamps
    end
  end
end
