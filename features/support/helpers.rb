def to_url string
  return root_path                             if string == "the homepage"
  return mobilization_path(Mobilization.first) if string == "the mobilization's page"
end

def to_element string
  return ".vision"     if string == "the Meu Rio's vision"
  return ".principles" if string == "the Meu Rio's principles"
end

def mobilization_field field
  return Mobilization.first.title       if field == "title"
  return Mobilization.first.description if field == "description"
  return Mobilization.first.hashtag     if field == "hashtag"
end