RSpec.configure do |config|
  config.before do
    User.any_instance.stub(:avatar_url).and_return("/assets/default-avatar.png")
  end
end
