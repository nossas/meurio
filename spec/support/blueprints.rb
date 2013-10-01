require 'machinist/active_record'

# Add your blueprints here.

Mobilization.blueprint do
  title       { Faker::Lorem.sentence }
  short_title       { Faker::Lorem.sentence }
  description { Faker::Lorem.paragraph }
  image       { File.open("#{Rails.root}/features/support/image.jpeg") }
  hashtag     { Faker::Lorem.word }
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
  file  { File.open("#{Rails.root}/features/support/image.jpeg") }
  uid   { sn.to_s }
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

Event.blueprint do
  # Attributes here
end
