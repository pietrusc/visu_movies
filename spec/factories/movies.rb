FactoryBot.define do
  factory :movie do
    color { true }
    genres { ['Drama', 'Comedy'] }
    title { Faker::Movie.title }

    association :director
  end
end
