require 'spec_helper'

describe Image do
  it { should validate_presence_of :url }
  it { should validate_presence_of :hashtag }
  it { should validate_uniqueness_of :url }
end
