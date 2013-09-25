class AddTextHtmlToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :text_html, :text
  end
end
