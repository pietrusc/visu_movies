# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    color { true }
    genres { %w(Drama Comedy) }
    title { Faker::Movie.title }

    association :director
  end
end
