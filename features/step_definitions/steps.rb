Given(/^(?:I'm in|I go to) "(.*?)"$/) do |arg1|
  visit to_url(arg1)
end

Given(/^there is a mobilization$/) do
  @mobilization = Mobilization.make!  
end

Given(/^this mobilization have a campaign$/) do
  @campaign = Campaign.make!(mobilization: @mobilization)
end

Given(/^this mobilization have a problem$/) do
  @problem = Problem.make!(mobilization: @mobilization)
end

Given(/^this campaign have many pokes$/) do
  rand(10..100).times { Poke.make! campaign: @campaign }
end

Given(/^this problem have many ideas$/) do
  rand(10..100).times { Idea.make! problem: @problem }
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
  rand(1..10).times { FacebookPost.make! hashtag: @mobilization.hashtag }
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

Then(/^I should see only (\d+) "(.*?)"$/) do |count, arg1|
  page.should have_css(to_element(arg1), text: to_text(arg1), count: count.to_i)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_css(to_element(arg1), text: to_text(arg1))
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  page.should_not have_css(to_element(arg1), text: to_text(arg1))
end

Then(/^I should see the mobilization's background image$/) do
  page.find('.cover')['style'].should include @mobilization.image
end

Then(/^I should see the mobilization's "(.*?)"$/) do |field|
  page.should have_content(mobilization_field(field))
end

Then(/^I should be in "(.*?)"$/) do |arg1|
  page.current_path.should be_== to_url(arg1)
end

Then(/^a mobilization should exists$/) do
  @mobilization = Mobilization.first  
end
