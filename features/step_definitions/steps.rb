Given(/^the mobilization has a background image$/) do
  @mobilization.background_image = 'cover.png'
  @mobilization.save!
end

When(/^(?:I'm in|I go to) "(.*?)"$/) do |arg1|
  visit to_url(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_css(to_element(arg1), text: to_text(arg1))
end

Then(/^I should see the mobilization's background image$/) do
  page.find('.cover')['style'].should include Mobilization.first.background_image
end

Then(/^I should see the mobilization's "(.*?)"$/) do |field|
  page.should have_content(mobilization_field(field))
end

Given(/^there is a mobilization$/) do
  @mobilization = Mobilization.make!
end

Given(/^this mobilization have a PdP campaign$/) do
  @campaign = Campaign.make!(mobilization: @mobilization)
end
