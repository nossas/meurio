require 'spec_helper'

describe Problem do
  it { should validate_presence_of :name }
  it { should validate_presence_of :link }
  it { should validate_presence_of :description }
  it { should validate_presence_of :mobilization_id }
  it { should belong_to :mobilization }
  it { should have_many(:ideas) }
end
