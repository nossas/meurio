def to_url string
  return root_path if string == "the homepage"
  raise "I don't know path '#{string}'"
end

def to_element string
  return ".vision"      if string == "the Meu Rio's vision"
  return ".principles"  if string == "the Meu Rio's principles"
  raise "I don't know element '#{string}'"
end
