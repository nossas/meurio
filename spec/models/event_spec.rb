require 'spec_helper'

describe Event do
  it { should validate_presence_of :hashtag }
  it { should validate_presence_of :uid }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :link }
  it { should validate_uniqueness_of :uid }
end
