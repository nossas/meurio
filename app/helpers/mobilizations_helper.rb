module MobilizationsHelper

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
