require 'machinist/active_record'

# Add your blueprints here.

Mobilization.blueprint do
  title         { Faker::Lorem.sentence }
  short_title   { Faker::Lorem.sentence }
  description   { Faker::Lorem.paragraph }
  image         { File.open("#{Rails.root}/features/support/image.jpeg") }
  hashtag       { Faker::Lorem.word }
  user          { User.make! }
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

Tweet.blueprint do
  username     { Faker::Internet.user_name }
  text         { Faker::Lorem.sentence(10) }
  hashtag      { Faker::Lorem.word }
  published_at { Time.current }
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
  published_at  { Time.current }
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
  published_at  { Time.current }
  link          { Faker::Internet.url }
  image         { File.open("#{Rails.root}/features/support/image.jpeg") }
  hashtag       { Faker::Lorem.word }
end

User.blueprint do
  first_name        { Faker::Name.first_name }
  last_name         { Faker::Name.last_name }
  email             { "#{sn.to_s}@meurio.org.br" }
  profession        { "Programmer" }
  facebook          { Faker::Internet.user_name }
  twitter           { Faker::Internet.user_name }
  city              { "Rio de Janeiro" }
  address_district  { "Botafogo" }
  state             { "RJ" }
  bio               { Faker::Lorem.paragraph }
  admin             { false }
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
  deadline { Time.current + 1.day }
  title { "Task #{sn}" }
  organization { Organization.make! }
end

TaskSubscription.blueprint do
  # Attributes here
end

Delivery.blueprint do
  user { User.make! }
  task { Task.make! }
end

Category.blueprint do
  name { 'Technology' }
end

TaskType.blueprint do
  name { 'Programming' }
  points { 10 }
  category { Category.make! }
  mode { 'remote' }
  badges { [ Badge.make! ] }
end

Badge.blueprint do
  name { Faker::Lorem.sentence }
  points { 2000 }
  image { File.open("#{Rails.root}/features/support/image.jpeg") }
end

Reward.blueprint do
  user { User.make! }
  task_type { TaskType.make! }
  points { 100 }
  source_app { 'Multitude' }
  source_model { 'Delivery' }
  source_id { sn }
end

Achievement.blueprint do
  # Attributes here
end

SuccessfulTransaction.blueprint do
  user { User.make! }
end

Organization.blueprint do
  city { "Rio de Janeiro" }
end

CompartilhacoCampaign.blueprint do
  user { User.make! }
end

CompartilhacoFacebookProfileSpreader.blueprint do
  user { User.make! }
  compartilhaco_campaign { CompartilhacoCampaign.make! }
end

CompartilhacoTwitterProfileSpreader.blueprint do
  user { User.make! }
  compartilhaco_campaign { CompartilhacoCampaign.make! }
end

PanelaCampaign.blueprint do
  name             { Faker::Lorem.sentence }
  description_html { Faker::Lorem.paragraph }
  hashtag          { Mobilization.make!.hashtag }
  user             { User.make! }
end

PanelaPoke.blueprint do
  panela_campaign { PanelaCampaign.make! }
  user { User.make! }
end

MultitudeReward.blueprint do
end
