# frozen_string_literal: true

FactoryBot.define do
  factory :movies_actor do
    association :movie
    association :actor
  end
end
