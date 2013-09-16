require 'machinist/active_record'

# Add your blueprints here.

Mobilization.blueprint do
  title { Faker::Lorem.sentence }
  description  { Faker::Lorem.paragraph }
end

Campaign.blueprint do
  name          { Faker::Lorem.sentence }
  description   { Faker::Lorem.paragraph }
  link          { Faker::Internet.url }
  mobilization
end
