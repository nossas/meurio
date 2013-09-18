def to_url string
  return root_path                             if string == "the homepage"
  return mobilization_path(@mobilization)      if string == "this mobilization page"
end

def to_element string
  return ".vision"                  if string == "the Meu Rio's vision"
  return ".principles"              if string == "the Meu Rio's principles"
  return ".history .item.campaign"  if string == "the PdP campaign on the mobilization history"
  return ".history .item.problem"   if string == "the Imagine problem on the mobilization history"
end

def to_text string
  return @campaign.name if string == "the PdP campaign on the mobilization history"
  return @problem.name     if string == "the Imagine problem on the mobilization history"
end

def mobilization_field field
  return @mobilization.title       if field == "title"
  return @mobilization.description if field == "description"
  return @mobilization.hashtag     if field == "hashtag"
end
