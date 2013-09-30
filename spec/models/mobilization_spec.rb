require 'spec_helper'

describe Mobilization do
  it { should validate_presence_of :title }
  it { should validate_presence_of :short_title }
  it { should validate_presence_of :hashtag }
  it { should validate_presence_of :description }
  it { should validate_presence_of :image }
  it { should have_many(:campaigns) }
  it { should have_many(:problems) }
end
