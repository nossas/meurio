class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.string :link
      t.text :description
      t.references :mobilization, index: true

      t.timestamps
    end
  end
end
