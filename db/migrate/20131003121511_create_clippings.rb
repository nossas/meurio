class CreateClippings < ActiveRecord::Migration
  def change
    create_table :clippings do |t|
      t.datetime :published_at
      t.text :body
      t.string :link
      t.string :image
      t.string :hashtag
      t.string :uid

      t.timestamps
    end
  end
end
