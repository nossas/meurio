module MobilizationsHelper
  def user_link comment
    if comment.tweet?
      "http://twitter.com/#{comment.username}"
    else
      "http://www.facebook.com/#{comment.user_uid}"
    end
  end
end
