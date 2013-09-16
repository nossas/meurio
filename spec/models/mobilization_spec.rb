require 'spec_helper'

describe Mobilization do
  it { should have_many(:campaigns) }
end
