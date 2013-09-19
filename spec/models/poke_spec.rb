require 'spec_helper'

describe Poke do
  it { should validate_presence_of :uid }
  it { should validate_uniqueness_of :uid }
end
