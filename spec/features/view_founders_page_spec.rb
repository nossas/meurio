require 'spec_helper'

feature "View founders page" do
  it "should have an slider" do
    visit founders_path
    expect(page).to have_css(".founders-slider")
  end
end
