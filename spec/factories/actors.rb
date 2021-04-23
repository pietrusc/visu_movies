# frozen_string_literal: true

FactoryBot.define do
  factory :actor do
    name { Faker::Movies::StarWars.character }
    fb_likes { 200 }
  end
end
