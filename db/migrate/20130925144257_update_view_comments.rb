class UpdateViewComments < ActiveRecord::Migration
  def up
    drop_view :comments
    create_view :comments, "
    SELECT t.id, t.created_at, t.text, t.hashtag, t.username, t.published_at, t.text_html, 'tweets' as relname FROM tweets t
    UNION ALL 
    SELECT fp.id, fp.created_at, fp.text, fp.hashtag, fp.username, fp.published_at, fp.text_html, 'facebook_posts' as relname FROM facebook_posts fp;"
  end

  def down
    drop_view :comments
    create_view :comments, "
    SELECT t.id, t.created_at, t.text, t.hashtag, t.username, t.published_at, 'tweets' as relname FROM tweets t
    UNION ALL 
    SELECT fp.id, fp.created_at, fp.text, fp.hashtag, fp.username, fp.published_at, 'facebook_posts' as relname FROM facebook_posts fp;"
  end
end
