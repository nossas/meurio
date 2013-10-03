require 'spec_helper'

describe Clipping do
  it { should validate_presence_of :published_at }
  it { should validate_presence_of :body }
  it { should validate_presence_of :link }
  it { should validate_presence_of :image }
  it { should validate_presence_of :hashtag }
  it { should validate_presence_of :uid }
  it { should validate_uniqueness_of :uid }
end
