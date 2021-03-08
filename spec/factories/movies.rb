FactoryBot.define do
  factory :movie do
    color { true }
    genres { ['Drama', 'Comedy'] }
    title { Faker::Movie.title }
=begin
    num_critic_for_reviews 100
    duration 100
    gross 2000000
    genres ['Drama', 'Comedy']
    title Faker::Movie.title
    num_voted_users 500
    facenumber_in_poster 3
    plot_keywords ['alien', 'american', 'civil war', 'male nipple', 'mars', 'princess']
    imdb_link 'http://www.imdb.com/title/tt2975590/?ref_=fn_tt_tt_1'
    num_user_for_reviews 1000
    language 'English'
    country 'USA'
    content_rating 'PG-13'
    budget 20000000
    release_year 2020
    imdb_score 7.8
    aspect_ratio 2.35
    fb_likes 5000
=end

    association :director
  end
end
