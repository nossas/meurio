require 'spec_helper'

describe Idea do
  it { should validate_presence_of :name }
  it { should validate_presence_of :link }
  it { should validate_presence_of :description }
  it { should validate_presence_of :problem_id }
  it { should belong_to :problem }
end
