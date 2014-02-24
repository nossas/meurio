require 'spec_helper'

describe Reward do
  it { should validate_presence_of :user_uid }
  it { should validate_presence_of :task_type_id }
  it { should validate_presence_of :points }
end
