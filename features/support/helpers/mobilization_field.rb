def mobilization_field field
  return @mobilization.short_title if field == "title"
  return @mobilization.description if field == "description"
  return @mobilization.hashtag     if field == "hashtag"
end
