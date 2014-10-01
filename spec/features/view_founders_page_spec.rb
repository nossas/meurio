require 'spec_helper'

feature "View founders page" do
  it "should have an slider" do
    visit founders_path
    expect(page).to have_css(".founders-slider")
  end

  it "should have an about section" do
    visit founders_path
    expect(page).to have_css(".founders-about")
  end

  it "should have an program section" do
    visit founders_path
    expect(page).to have_css(".founders-program")
  end
end
