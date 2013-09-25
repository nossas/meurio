class CreateFacebookPosts < ActiveRecord::Migration
  def change
    create_table :facebook_posts do |t|
      t.text :text
      t.string :hashtag
      t.string :username
      t.datetime :published_at
      t.string :uid

      t.timestamps
    end
  end
end
