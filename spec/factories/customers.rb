# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
  end
end
