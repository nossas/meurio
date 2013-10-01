require 'spec_helper'

describe Event do
  it { should validate_presence_of :hashtag }
  it { should validate_presence_of :uid }
  it { should validate_uniqueness_of :uid }
end
