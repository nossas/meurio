require 'machinist/active_record'

# Add your blueprints here.

Mobilization.blueprint do
  title            { Faker::Lorem.sentence }
  description      { Faker::Lorem.paragraph }
  image            { "http://lorempixel.com/1920/500/abstract/#{sn.to_i}.png" }
  hashtag          { Faker::Lorem.word }
end

Campaign.blueprint do
  name              { Faker::Lorem.sentence }
  description_html  { Faker::Lorem.paragraph }
  link              { Faker::Internet.url }
  uid               { sn }
  mobilization
end

Problem.blueprint do
  name          { Faker::Lorem.sentence }
  description   { Faker::Lorem.paragraph }
  link          { Faker::Internet.url }
  uid           { sn }
  mobilization
end

Idea.blueprint do
  name          { Faker::Lorem.sentence }
  description   { Faker::Lorem.paragraph }
  link          { Faker::Internet.url }
  uid           { sn }
end

Poke.blueprint do
  uid { sn }
end

Tweet.blueprint do
  username     { Faker::Internet.user_name }
  text         { Faker::Lorem.paragraph(1) }
  hashtag      { Faker::Lorem.word }
  published_at { Time.now }
  uid          { sn.to_s }
end

Image.blueprint do
  remote_file_url { "http://lorempixel.com/1024/768/abstract/#{sn.to_i}" }
  uid             { sn.to_s }
end

FacebookPost.blueprint do
  username      { Faker::Internet.user_name }
  text          { Faker::Lorem.paragraph(1) }
  hashtag       { Faker::Lorem.word }
  published_at  { Time.now }
  uid           { sn.to_s }
end

Comment.blueprint do
  # Attributes here
end
