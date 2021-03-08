require 'csv'
require 'open-uri'

class ImportMovies
  IMPORT_CSV_URL = 'https://raw.githubusercontent.com/PacktPublishing/Pandas-Cookbook/master/data/movie.csv'.freeze

  def call
    csv_text = open(IMPORT_CSV_URL)
    CSV.parse(csv_text, :headers=>true) do |row|
      director = create_director(row)
      movie = create_movie(row, director)
      create_actors(row, movie)
    end
  end

  private

  def create_movie(row, director)
    Movie.create!(
        director: director,
        color: color?(row['color']),
        num_critic_for_reviews: row['num_critic_for_reviews'],
        duration: row['duration'],
        gross: row['gross'],
        genres: parse_to_array(row['genres']),
        title: row['movie_title'],
        num_voted_users: row['num_voted_users'],
        facenumber_in_poster: row['facenumber_in_poster'],
        plot_keywords: parse_to_array(row['plot_keywords']),
        imdb_link: row['movie_imdb_link'],
        num_user_for_reviews: row['num_user_for_reviews'],
        language: row['language'],
        country: row['country'],
        content_rating: row['content_rating'],
        budget: row['budget'],
        year: row['title_year'],
        imdb_score: row['imdb_score'],
        aspect_ratio: row['aspect_ratio'],
        fb_likes: row['movie_facebook_likes']
    )
  end

  def create_actors(row, movie)
    (1..3).each do |i|
      actor = Actor.where(name: row["actor_#{i}_name"]).first_or_create!(fb_likes: row["actor_#{i}_facebook_likes"])
      MoviesActor.create!(actor: actor, movie: movie)
    end
  end

  def create_director(row)
    Director.where(name: row['director_name']).first_or_create!(fb_likes: row['director_facebook_likes'])
  end

  def color?(value)
    return true if value == 'Color'

    false if value == 'Black and White'
  end

  def parse_to_array(value)
    return [] unless value

    value.split("|")
  end
end
