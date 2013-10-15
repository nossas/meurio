Given(/^there is no users$/) do
  User.delete_all
end

Given(/^there is an user$/) do
  @user = User.make!
end

Given(/^there is an user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  @user = User.make! email: email, password: password
end

Given(/^there is an user logged in$/) do
  @user = User.make!
  visit root_path
  fill_in 'login_email', with: @user.email
  fill_in 'login_password', with: @user.password
  click_button 'Entrar na Rede'
end
