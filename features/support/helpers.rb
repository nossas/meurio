def to_url string
  return root_path if string == "the homepage"
end

def to_element string
  return ".vision"      if string == "the Meu Rio's vision"
  return ".principles"  if string == "the Meu Rio's principles"
end
