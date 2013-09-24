require 'spec_helper'

describe Image do
  it { should validate_presence_of :uid }
  it { should validate_presence_of :hashtag }
  it { should validate_uniqueness_of :uid }
end
