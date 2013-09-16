def to_url string
  return root_path                             if string == "the homepage"
  return mobilization_path(Mobilization.first) if string == "the mobilization's page"
end

def to_element string
  return ".vision"     if string == "the Meu Rio's vision"
  return ".principles" if string == "the Meu Rio's principles"
end
