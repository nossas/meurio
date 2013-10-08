Given(/^there is an user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  @user = User.make! email: email, password: password
end
