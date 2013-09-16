require 'machinist/active_record'

# Add your blueprints here.

Mobilization.blueprint do
  title            { Faker::Lorem.sentence }
  description      { Faker::Lorem.paragraph }
  background_image { Faker::Internet.url }
end
