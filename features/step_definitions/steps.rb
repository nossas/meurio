Given(/^there are (\d+) mobilizations?$/) do |arg1|
  arg1.to_i.times { Mobilization.make! }
end

When(/^(?:I'm in|I go to) "(.*?)"$/) do |arg1|
  visit to_url(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_css(to_element(arg1))
end

Then(/^I should see the mobilization's title$/) do
  page.should have_content(Mobilization.first.title)
end
