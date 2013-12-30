def to_url string
  return root_path                             if string == "the homepage"
  return mobilizations_path                    if string == "the mobilizations page"
  return mobilization_path(@mobilization)      if string == "this mobilization page"
  return mobilization_path(1)                  if string == "the first mobilization page"
  return new_mobilization_path                 if string == "new mobilization page"
  return edit_mobilization_path(@mobilization) if string == "edit mobilization page"
  return edit_profile_path                     if string == "edit profile page"
  return user_path(@user)                      if string == "this user page"
  return "/meurio_accounts"                    if string == "the Meu Rio accounts login page"
end
