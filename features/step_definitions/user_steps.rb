Given(/^there is an user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  @user = User.make! email: email, password: password
end

Given(/^there is no users$/) do
  User.delete_all
end