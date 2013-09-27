def to_url string
  return root_path                        if string == "the homepage"
  return mobilization_path(@mobilization) if string == "this mobilization page"
  return new_mobilization_path            if string == "new mobilization page"
end

def to_element string
  return ".vision"                                      if string == "the Meu Rio's vision"
  return ".principles"                                  if string == "the Meu Rio's principles"
  return ".history .item.campaigns"                     if string == "the campaign on the mobilization history"
  return ".history .item.problems"                      if string == "the problem on the mobilization history"
  return ".comments .item.tweets"                       if string == "the tweet on the mobilization comments"
  return ".comments .item.tweets"                       if string == "tweets on the mobilization comments"
  return ".comments .item.tweets a"                     if string == "the tweet's hashtag link"
  return ".comments .item.tweets a"                     if string == "the tweet's link"
  return ".comments .item.tweets .username a"           if string == "the twitter username's link"
  return ".pokes_counter .counter"                      if string == "the pokes counter"
  return ".ideas_counter .counter"                      if string == "the ideas counter"
  return ".shares_counter .counter"                     if string == "the shares counter"
  return ".images .empty"                               if string == "this mobilization have no image yet"
  return ".images img[src='#{@image.file.square.url}']" if string == "this mobilization image"
  return ".comments .empty"                             if string == "this mobilization have no comment yet"
  return ".facebook_posts .text"                        if string == "this mobilization Facebook post"
  return ".mobilization form"                           if string == "the mobilization form"
  return ".mobilization .share .twitter-share-button"   if string == "the Twitter share button of this mobilization"
  return ".mobilization .share .facebox-share-button"   if string == "the Facebook share button of this mobilization"
end

def to_text string
  return @campaign.name               if string == "the campaign on the mobilization history"
  return @problem.name                if string == "the problem on the mobilization history"
  return @tweet.text                  if string == "the tweet on the mobilization comments"
  return @tweet.hashtag               if string == "the tweet's hashtag link"
  return @tweet.username              if string == "the twitter username's link"
  return @mobilization.pokes.count    if string == "the pokes counter"
  return @mobilization.ideas.count    if string == "the ideas counter"
  return @facebook_post.text          if string == "this mobilization Facebook post"
  return @mobilization.comments.count if string == "the shares counter"
end

def mobilization_field field
  return @mobilization.title       if field == "title"
  return @mobilization.description if field == "description"
  return @mobilization.hashtag     if field == "hashtag"
end
