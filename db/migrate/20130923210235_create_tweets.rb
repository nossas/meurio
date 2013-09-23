class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.string :hashtag
      t.string :username
      t.datetime :published_at

      t.timestamps
    end
  end
end
