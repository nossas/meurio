def to_url string
  return root_path                             if string == "the homepage"
  return mobilizations_path                    if string == "the mobilizations page"
  return mobilization_path(@mobilization)      if string == "this mobilization page"
  return mobilization_path(1)                  if string == "the first mobilization page"
  return new_mobilization_path                 if string == "new mobilization page"
  return edit_mobilization_path(@mobilization) if string == "edit mobilization page"
  return edit_profile_path                     if string == "edit profile page"
  return user_path(@user)                      if string == "this user page"
end

def to_element string
  return ".vision"                                                  if string == "the Meu Rio's vision"
  return ".principles"                                              if string == "the Meu Rio's principles"
  return ".funding"                                                 if string == "the Meu Rio's funding"
  return ".history .item.campaigns"                                 if string == "the campaign on the mobilization history"
  return ".history .item.problems"                                  if string == "the problem on the mobilization history"
  return ".history .item.events"                                    if string == "the event on the mobilization history"
  return ".comments .item.tweets"                                   if string == "the tweet on the mobilization comments"
  return ".comments .item.tweets"                                   if string == "tweets on the mobilization comments"
  return ".comments .item.tweets a"                                 if string == "the tweet's hashtag link"
  return ".comments .item.tweets a"                                 if string == "the tweet's link"
  return ".comments .item.tweets .username a"                       if string == "the twitter username's link"
  return ".pokes_counter .counter"                                  if string == "the pokes counter"
  return ".ideas_counter .counter"                                  if string == "the ideas counter"
  return ".shares_counter .counter"                                 if string == "the shares counter"
  return ".attending_count .counter"                                if string == "the attendees counter"
  return ".images .empty"                                           if string == "this mobilization have no image yet"
  return ".images img[src='#{@image.file.square.url}']"             if string == "this mobilization image"
  return ".comments .empty"                                         if string == "this mobilization have no comment yet"
  return ".facebook_posts .text"                                    if string == "this mobilization Facebook post"
  return ".mobilization form"                                       if string == "the mobilization form"
  return ".mobilization .share .twitter-share-button"               if string == "the Twitter share button of this mobilization"
  return ".mobilization .share .facebook-share-button"              if string == "the Facebook share button of this mobilization"
  return ".field_with_errors label[for='mobilization_title']"       if string == "mobilization title field error"
  return ".field_with_errors label[for='mobilization_short_title']" if string == "mobilization short title field error"
  return ".field_with_errors label[for='mobilization_description']" if string == "mobilization description field error"
  return ".field_with_errors label[for='mobilization_hashtag']"     if string == "mobilization hashtag field error"
  return ".field_with_errors label[for='mobilization_image']"       if string == "mobilization image field error"
  return "#action-of-the-day"                                       if string == "the action of the day"
  return "#action-of-the-day #action-header .last"                  if string == "the action of the day attending counter"
  return ".clippings .empty"                                        if string == "this mobilization have no clipping yet"
  return ".clippings .body"                                         if string == "this mobilization clipping"
  return "#team"                                                    if string == "the team"
  return "team_button"                                              if string == "the team button"
  return "edit_mobilization_button"                                 if string == "the edit mobilization button"
  return ".login form"                                              if string == "the login form"
  return ".field_with_errors label[for='login_email']"              if string == "login email field error"
  return ".field_with_errors label[for='login_password']"           if string == "login password field error"
  return ".field_with_errors label[for='signup_first_name']"        if string == "signup first name field error"
  return ".field_with_errors label[for='signup_last_name']"         if string == "signup last name field error"
  return ".field_with_errors label[for='signup_email']"             if string == "signup email field error"
  return ".field_with_errors label[for='signup_password']"          if string == "signup password field error"
  return ".field_with_errors label[for='password_recovery_email']"  if string == "password recovery email field error"
  return ".field_with_errors label[for='user_current_password']"    if string == "current password field error"
  return ".flash .notice"                                           if string == "a success message"
  return ".flash .alert"                                            if string == "an alert message"
  return ".mobilizations .mobilization"                             if string == "this mobilization in the mobilizations list"
  return ".network"                                                 if string == "the network explanation"
  return "users_button"                                             if string == "the users button"
  return "#users"                                                   if string == "the users"
  return "form.edit_user"                                           if string == "the edit user form"
  return ".field_with_errors label[for='user_first_name']"          if string == "user first name field error"
  return ".field_with_errors label[for='user_last_name']"           if string == "user last name field error"
  return ".users_activities .campaigns"                             if string == "this campaign on the users activities"
  return ".users_activities .pokes"                                 if string == "this poke on the users activities"
  return ".users_activities .problems"                              if string == "this problem on the users activity"
  return ".users_activities .ideas"                                 if string == "this idea on the users activity"
  return ".home-address"                                            if string == "home address"
  return ".work-address"                                            if string == "work address"
  return "img[src='#{@user.image.square.url}']"                     if string == "this user image"
  return ".user_name"                                               if string == "this user name"
  return ".user_profession"                                         if string == "this user profession"
  return ".user_facebook_url[href='#{@user.facebook_url}']"         if string == "this user Facebook link"
  return ".user_twitter_url[href='#{@user.twitter_url}']"           if string == "this user Twitter link"
  return ".user_city"                                               if string == "this user city"
  return ".user_state"                                              if string == "this user state"
  return ".user_bio"                                                if string == "this user bio"
  return ".alert"                                                   if string == "you are not authorized to access this page"
  return ".activities .empty"                                       if string == "there is no activity yet"
  return ".activities .pokes"                                       if string == "this poke in the activity feed"
  return ".activities .campaigns"                                   if string == "this campaign in the activity feed"
  return ".activities .ideas"                                       if string == "this idea in the activity feed"
  return ".activities .problems"                                    if string == "this problem in the activity feed"
  return string
end

def to_text string
  return @campaign.name                             if string == "the campaign on the mobilization history"
  return @problem.name                              if string == "the problem on the mobilization history"
  return @event.name                                if string == "the event on the mobilization history"
  return @tweet.text                                if string == "the tweet on the mobilization comments"
  return @tweet.hashtag                             if string == "the tweet's hashtag link"
  return @tweet.username                            if string == "the twitter username's link"
  return @mobilization.pokes.count                  if string == "the pokes counter"
  return @mobilization.ideas.count                  if string == "the ideas counter"
  return @facebook_post.text                        if string == "this mobilization Facebook post"
  return @mobilization.share_count                  if string == "the shares counter"
  return @mobilization.attending_count              if string == "the attendees counter"
  return @mobilization.action_of_the_day.try(:name) if string == "the action of the day"
  return @mobilization.action_of_the_day.counter    if string == "the action of the day attending counter"
  return @clipping.body                             if string == "this mobilization clipping"
  return @mobilization.title                        if string == "this mobilization in the mobilizations list"
  return @campaign.hashtag                          if string == "this campaign on the users activities"
  return @poke.campaign.hashtag                     if string == "this poke on the users activities"
  return @problem.hashtag                           if string == "this problem on the users activity"
  return @idea.problem.hashtag                      if string == "this idea on the users activity"
  return @user.name                                 if string == "this user name"
  return @user.profession                           if string == "this user profession"
  return @user.home_city                            if string == "this user city"
  return @user.home_state                           if string == "this user state"
  return @user.bio                                  if string == "this user bio"
  return I18n.t("unauthorized.default")             if string == "you are not authorized to access this page"
  return I18n.t("activity.pokes")                   if string == "this poke in the activity feed"
  return I18n.t("activity.campaigns")               if string == "this campaign in the activity feed"
  return I18n.t("activity.ideas")                   if string == "this idea in the activity feed"
  return I18n.t("activity.problems")                if string == "this problem in the activity feed"
end

def mobilization_field field
  return @mobilization.short_title if field == "title"
  return @mobilization.description if field == "description"
  return @mobilization.hashtag     if field == "hashtag"
end

def user_field field
  return @user.password if field == "password"
end