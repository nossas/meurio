module MobilizationsHelper

  def twitify_text text
    link_twitter_hashtag(link_text(text)).html_safe
  end

  def link_text text
    text.gsub(/(http|https)(:\/\/)([^ ]+)/, link_to('\1\2\3', '\1\2\3', class: 'link', target: :blank))
  end

  def link_twitter_hashtag text
    text.gsub(/#([^ ]+)/, link_to('#\1', 'http://twitter.com/search?q=%23\1&f=realtime', class: 'hashtag', target: :blank))
  end

  def link_twitter_user username
    link_to "@#{username}", "http://twitter.com/#{username}", target: :blank
  end

  def user_link comment
    if comment.tweet?
      "http://twitter.com/#{comment.username}"
    else
      "http://www.facebook.com/#{comment.user_uid}"
    end
  end
end
