class AddTextHtmlToFacebookPosts < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :text_html, :text
  end
end
