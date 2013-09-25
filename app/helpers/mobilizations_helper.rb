module MobilizationsHelper

  def link_twitter_user username
    link_to "@#{username}", "http://twitter.com/#{username}", target: :blank
  end
end