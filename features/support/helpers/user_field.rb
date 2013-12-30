def user_field field
  return @user.password if field == "password"
end
