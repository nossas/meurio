Given(/^I'm logged in$/) do
  @current_user = User.make! email: "ssi@meurio.org.br"
  visit root_path
end

Given(/^I'm logged in as admin$/) do
  @current_user = User.make! email: "ssi@meurio.org.br", admin: true
  visit root_path
end

Given(/^(?:I'm in|I go to) "(.*?)"$/) do |arg1|
  visit to_url(arg1)
end

Given(/^there is a mobilization$/) do
  @mobilization = Mobilization.make!
end

Given(/^this mobilization have a campaign$/) do
  @campaign = Campaign.make!(hashtag: @mobilization.hashtag)
end

Given(/^this mobilization have a problem$/) do
  @problem = Problem.make!(hashtag: @mobilization.hashtag)
end

Given(/^this campaign have many pokes$/) do
  rand(10..100).times { Poke.make! campaign: @campaign }
end

Given(/^this campaign have (\d+) pokes$/) do |count|
  count.to_i.times { Poke.make! campaign: @campaign }
end

Given(/^there is campaign$/) do
  @campaign = Campaign.make!
end

Given(/^this problem have many ideas$/) do
  rand(10..100).times { Idea.make! problem: @problem }
end

Given(/^this problem have (\d+) ideas$/) do |count|
  count.to_i.times { Idea.make! problem: @problem }
end

Given(/^this mobilization have an image$/) do
  @image = Image.make! hashtag: @mobilization.hashtag
end

Given(/^this mobilization have many tweets$/) do
  rand(10..50).times { Tweet.make! hashtag: @mobilization.hashtag }
end

Given(/^this mobilization have a tweet$/) do
  @tweet = Tweet.make! hashtag: @mobilization.hashtag
end

Given(/^this mobilization have a tweet with a hashtag$/) do
  @tweet = Tweet.make! hashtag: @mobilization.hashtag, text: "##{@mobilization.hashtag}"
end

Given(/^this mobilization have a tweet with a link$/) do
  @tweet = Tweet.make! hashtag: @mobilization.hashtag, text: Faker::Internet.url
end

Given(/^this mobilization have a Facebook post$/) do
  @facebook_post = FacebookPost.make! hashtag: @mobilization.hashtag
end

Given(/^this mobilization have some shares$/) do
  FacebookPost.make! hashtag: @mobilization.hashtag, share_count: 10, like_count: 20
end

Given(/^this mobilization have an event$/) do
  @event = Event.make! hashtag: @mobilization.hashtag
end

Given(/^this event have some attendees$/) do
  @event.update_attributes attending_count: 100
end

Given(/^this event have (\d+) attendees$/) do |count|
  @event.update_attributes attending_count: count.to_i
end

Given(/^this mobilization have a clipping$/) do
  @clipping = Clipping.make! hashtag: @mobilization.hashtag
end

Given(/^this petition have some signatures$/) do
  @petition.update_attributes signatures_count: 100
end

Given(/^there is a poke$/) do
  @poke = Poke.make!
end

Given(/^there is a problem$/) do
  @problem = Problem.make!
end

Given(/^there is an idea$/) do
  @idea = Idea.make!
end

Given(/^there is a category called "(.*?)"$/) do |arg1|
  @category = Category.make! name: arg1
end

Given(/^there is a task type$/) do
  @task_type = TaskType.make!
end

Given(/^there is a mobilization of mine$/) do
  @mobilization = Mobilization.make! user: @current_user
end

Given(/^there is a poke made by this user$/) do
  @poke = Poke.make! user: @user
end

Given(/^there is a campaign created by this user$/) do
  @campaign = Campaign.make! user: @user
end

Given(/^there is an idea created by this user$/) do
  @idea = Idea.make! user: @user
end

Given(/^there is a problem created by this user$/) do
  @problem = Problem.make! user: @user
end

Given(/^this mobilization have a petition$/) do
  @petition = Petition.make!(hashtag: @mobilization.hashtag)
end

Given(/^there is an admin$/) do
  User.make! admin: true
end

Given(/^there is (\d+) users$/) do |arg1|
  arg1.to_i.times { User.make! }
end

Given(/^there is (\d+) admin users$/) do |arg1|
  arg1.to_i.times { User.make! admin: true }
end

Given(/^there is (\d+) funders$/) do |arg1|
  arg1.to_i.times { User.make! funder: true }
end

Given(/^there is (\d+) sponsors$/) do |arg1|
  arg1.to_i.times { User.make! sponsor: true }
end

When(/^I attach an image to "([^"]*)"$/) do |arg1|
  attach_file to_element(arg1), File.dirname(__FILE__) + "/../support/mobilization.jpg"
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^I fill "([^"]*)" with my "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: user_field(arg2)
end

When(/^I fill "(.*?)" within "(.*?)" with "(.*?)"$/) do |field, where, text|
  within to_element(where) do
    fill_in field, with: text
  end
end

When /^I press "([^"]*)"$/ do |arg1|
  click_button arg1
end

When /^I click "([^"]*)"$/ do |arg1|
  click_link to_link(arg1)
end

When /^I choose "([^"]*)"$/ do |arg1|
  choose to_element(arg1)
end

When /^I check "([^"]*)"$/ do |arg1|
  check to_element(arg1)
end

Given(/^I select "(.*?)" from "(.*?)"$/) do |arg1, arg2|
  select arg1, from: arg2
end

When(/^I select "(.*?)" within "(.*?)"$/) do |arg1, where|
  within to_element(where) do
    select to_element(arg1)
  end
end

Then(/^I should see only (\d+) "(.*?)"$/) do |count, arg1|
  page.should have_css(to_element(arg1), text: to_text(arg1), count: count.to_i)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_css(to_element(arg1), text: to_text(arg1))
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  page.should_not have_css(to_element(arg1), text: to_text(arg1))
end

Then(/^"(.*?)" should contain "(.*?)"$/) do |arg1, arg2|
  find(to_element(arg1)).should have_content(arg2)
end

Then(/^I should see the mobilization's background image$/) do
  page.find('.cover')['style'].should include @mobilization.image.url
end

Then(/^I should see the mobilization's "(.*?)"$/) do |field|
  page.should have_content(mobilization_field(field))
end

Then(/^I should be in "(.*?)"$/) do |arg1|
  page.current_path.should be_== to_url(arg1)
end

Then(/^I should be logged in$/) do
  page.should have_css(".login", text: @user.name)
end

Then(/^I should not be logged in$/) do
  @user.should be_nil
end

Then(/^show me the page$/) do
  save_and_open_page
end

Then(/^an email should be sent to "(.*?)"$/) do |arg1|
  ActionMailer::Base.deliveries.select{|e| e.to.include?(arg1)}.should_not be_empty
end

Then(/^no email should be sent$/) do
  ActionMailer::Base.deliveries.should be_empty
end

Then(/^I log in with password "(.*?)"$/) do |password|
  pending
end

Then(/^I should see (\d+) "(.*?)"$/) do |arg1, arg2|
  page.should have_css(to_element(arg2), count: arg1)
end

Given(/^there is a task category$/) do
  @category = Category.make!
end

Given(/^there is a task for this category$/) do
  @task = Task.make!(task_type: TaskType.make!(category: @category))
end

Given(/^this user delivered this task$/) do
  @delivery = Delivery.make! task_subscription: TaskSubscription.make!(user: @user, task: @task)
end

Given(/^this delivery is accepted$/) do
  @delivery.update_attribute :accepted_at, Time.current
  Reward.make! user: @user, task_type: @task.task_type
end

Given(/^there is a matching task with my profile$/) do
  @current_user.update_attribute :skills, [:programming]
  @task = Task.make! skills: [:programming]
end

Given(/^this user subscribed for a task$/) do
  @task = Task.make!
  @task_subscription = TaskSubscription.make! user: @user, task: @task
end

Given(/^this user finished this task$/) do
  Delivery.make! task_subscription: @task_subscription, accepted_at: Time.current
end

Given(/^there is a badge$/) do
  @badge = Badge.make!
end

Given(/^there is a badge called "(.*?)"$/) do |arg1|
  @badge = Badge.make! name: arg1
end

Given(/^this user have a badge$/) do
  @badge = Badge.make!
  @user.badges << @badge
end

Given(/^this user have (\d+) badges$/) do |arg1|
  arg1.to_i.times { @user.badges << Badge.make! }
end

Given(/^there is (\d+) mobilizations$/) do |arg1|
  arg1.to_i.times { Mobilization.make! }
end
