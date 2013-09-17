require 'machinist/active_record'

# Add your blueprints here.

Mobilization.blueprint do
  title            { Faker::Lorem.sentence }
  description      { Faker::Lorem.paragraph }
  background_image { "http://lorempixel.com/1920/500/abstract/#{sn.to_i}" }
  hashtag          { Faker::Lorem.word }
end

Campaign.blueprint do
  name          { Faker::Lorem.sentence }
  description   { Faker::Lorem.paragraph }
  link          { Faker::Internet.url }
  mobilization
end

Idea.blueprint do
  name          { Faker::Lorem.sentence }
  description   { Faker::Lorem.paragraph }
  link          { Faker::Internet.url }
  mobilization
end
