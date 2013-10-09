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

When(/^I attach an image to "([^"]*)"$/) do |arg1|
  attach_file arg1, File.dirname(__FILE__) + "/../support/mobilization.jpg"
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When /^I press "([^"]*)"$/ do |arg1|
  click_button arg1
end

When /^I click "([^"]*)"$/ do |arg1|
  click_link to_element(arg1)
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
  page.should have_css(".login", text: @user.email)
end
