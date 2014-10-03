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

  it "should have an steps section" do
    visit founders_path
    expect(page).to have_css(".founders-steps")
  end

  it "should have an network section" do
    visit founders_path
    expect(page).to have_css(".founders-network")
  end

  it "should have an moderators section" do
    visit founders_path
    expect(page).to have_css(".founders-moderators")
  end

  it "should have a subscription section" do
    visit founders_path
    expect(page).to have_css(".founders-subscription")
  end
end
