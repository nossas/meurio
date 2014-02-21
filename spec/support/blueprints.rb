require 'machinist/active_record'

# Add your blueprints here.

Mobilization.blueprint do
  title       { Faker::Lorem.sentence }
  short_title { Faker::Lorem.sentence }
  description { Faker::Lorem.paragraph }
  image       { File.open("#{Rails.root}/features/support/image.jpeg") }
  hashtag     { Faker::Lorem.word }
  user        { User.make! }
end

Campaign.blueprint do
  name              { Faker::Lorem.sentence }
  description_html  { Faker::Lorem.paragraph }
  link              { Faker::Internet.url }
  uid               { sn }
  hashtag           { Mobilization.make!.hashtag }
  user              { User.make! }
end

Problem.blueprint do
  name          { Faker::Lorem.sentence }
  description   { Faker::Lorem.paragraph }
  link          { Faker::Internet.url }
  uid           { sn }
  hashtag       { Mobilization.make!.hashtag }
  user          { User.make! }
end

Idea.blueprint do
  name          { Faker::Lorem.sentence }
  description   { Faker::Lorem.paragraph }
  link          { Faker::Internet.url }
  uid           { sn }
  user          { User.make! }
  problem       { Problem.make! }
end

Poke.blueprint do
  uid       { sn }
  campaign  { Campaign.make! }
  user      { User.make! }
end

Tweet.blueprint do
  username     { Faker::Internet.user_name }
  text         { Faker::Lorem.sentence(10) }
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
  text          { Faker::Lorem.sentence(10) }
  hashtag       { Faker::Lorem.word }
  published_at  { Time.now }
  uid           { sn.to_s }
end

Comment.blueprint do
  # Attributes here
end

Event.blueprint do
  uid         { sn.to_s }
  description { Faker::Lorem.sentence(10) }
  name        { Faker::Lorem.sentence }
  link        { Faker::Internet.url }
end

Clipping.blueprint do
  uid           { sn.to_s }
  body          { "My clipping body #{sn}" }
  published_at  { Time.now }
  link          { Faker::Internet.url }
  image         { File.open("#{Rails.root}/features/support/image.jpeg") }
  hashtag       { Faker::Lorem.word }
end

User.blueprint do
  first_name    { Faker::Name.first_name }
  last_name     { Faker::Name.last_name }
  email         { "#{sn.to_s}@meurio.org.br" }
  profession    { "Programmer" }
  facebook      { Faker::Internet.user_name }
  twitter       { Faker::Internet.user_name }
  city          { "Rio de Janeiro" }
  state         { "RJ" }
  bio           { Faker::Lorem.paragraph }
  admin         { false }
end

Activity.blueprint do
  # Attributes here
end

Petition.blueprint do
  name              { Faker::Lorem.sentence }
  description_html  { Faker::Lorem.paragraph }
  link              { Faker::Internet.url }
  uid               { sn }
  hashtag           { Mobilization.make!.hashtag }
end

Task.blueprint do
  points { 10 }
  task_type { TaskType.make! }
  mobilization { Mobilization.make! }
  deadline { Time.now + 1.day }
  title { "Task #{sn}" }
end

TaskSubscription.blueprint do
  # Attributes here
end

Delivery.blueprint do
  # Attributes here
end

Category.blueprint do
  name { "Technology" }
end

TaskType.blueprint do
  name { "Programming" }
  points { 10 }
  category { Category.make! }
  mode { 'remote' }
end

Badge.blueprint do
  name { Faker::Lorem.sentence }
  points { 2000 }
  image { File.open("#{Rails.root}/features/support/image.jpeg") }
end

Reward.blueprint do
  # Attributes here
end
