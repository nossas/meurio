require 'spec_helper'

describe Tweet do
  it { should validate_presence_of :username }
  it { should validate_presence_of :text }
  it { should validate_presence_of :hashtag }
  it { should validate_presence_of :published_at }
end
