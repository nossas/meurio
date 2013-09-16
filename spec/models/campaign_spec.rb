require 'spec_helper'

describe Campaign do
  it { should validate_presence_of :name }
  it { should validate_presence_of :link }
  it { should validate_presence_of :description }
  it { should validate_presence_of :mobilization_id }
  it { should belong_to :mobilization }
end
