Given(/^there is no users$/) do
  User.delete_all
end

Given(/^there is an user$/) do
  @user = User.make!
end

Given(/^there is an user with email "(.*?)"$/) do |email|
  @user = User.make! email: email
end

Given(/^there is an user logged in$/) do
  pending
end
