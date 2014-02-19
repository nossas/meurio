require 'spec_helper'

describe Badge do
  it { should have_and_belong_to_many :task_types }
  it { should validate_presence_of :name }
  it { should validate_presence_of :points }
  it { should validate_presence_of :image }
end
