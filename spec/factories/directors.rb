FactoryBot.define do
  factory :director do
    name { Faker::Movies::StarWars.character }
    fb_likes { 100 }
  end
end
