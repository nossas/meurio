require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should allow_value("email@addresse.foo").for(:email) }
  it { should_not allow_value("foo").for(:email) }
end
