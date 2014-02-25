require 'spec_helper'

describe Reward do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :task_type_id }
  it { should validate_presence_of :points }
  it { should validate_presence_of :source_app }
  it { should validate_presence_of :source_model }
  it { should validate_presence_of :source_id }
end
