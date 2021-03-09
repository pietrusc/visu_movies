require 'rails_helper'

describe MovieSerializer do
  let(:director) { create(:director) }
  let(:movie) do
    create(:movie,
           num_critic_for_reviews: 300,
           duration: 180,
           gross: 7000000000,
           plot_keywords: ['alien', 'american', 'civil war', 'male nipple', 'mars', 'princess'],
           imdb_link: 'http://www.imdb.com/title/tt2975590/?ref_=fn_tt_tt_1',
           imdb_score: 7.8,
           year: 2000,
           director: director)
  end

  it 'returns without included' do
    results = MovieSerializer.new(movie).serialized_json
    res = JSON.parse(results)
    expect(res.keys).not_to include('included')
  end

  it 'returns movie attributes' do
    results = MovieSerializer.new(movie).serialized_json
    res = JSON.parse(results)
    expect(res['data']['attributes']).to eq(
      {
          "title" => "#{movie.title}",
          "year" => 2000,
          "color" => true,
          "num_critic_for_reviews" => 300,
          "duration" => 180,
          "gross" => 7000000000,
          "num_voted_users" => nil,
          "facenumber_in_poster" => nil,
          "imdb_link" => "http://www.imdb.com/title/tt2975590/?ref_=fn_tt_tt_1",
          "num_user_for_reviews" => nil,
          "language" => nil,
          "country" => nil,
          "content_rating" => nil,
          "budget" => nil,
          "imdb_score" => "7.8",
          "aspect_ratio" => nil,
          "fb_likes" => nil,
          "plot_keywords" => ["alien", "american", "civil war", "male nipple", "mars", "princess"],
          "genres" => ["Drama", "Comedy"]
      })
  end

  it 'includes actors and director when specified' do
    actor = create(:actor)
    actor2 = create(:actor)
    create(:movies_actor, movie: movie, actor: actor)
    create(:movies_actor, movie: movie, actor: actor2)
    options = {}
    options[:include] = ['actors', 'director']
    results = MovieSerializer.new(movie, options).serialized_json
    res = JSON.parse(results)
    expect(res['included'].size).to eq(3)
  end

  it 'serialize multiple movies' do
    movie2 = create(:movie)
    results = MovieSerializer.new([movie, movie2]).serialized_json
    res = JSON.parse(results)
    expect(res['data'].size).to eq(2)
  end
end
