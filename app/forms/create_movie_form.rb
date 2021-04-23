# frozen_string_literal: true

class CreateMovieForm
  include ActiveModel::Model

  attr_accessor(
    :title, :year, :color, :num_critic_for_reviews, :duration, :gross, :num_voted_users,
    :facenumber_in_poster, :imdb_link, :num_user_for_reviews, :language, :country, :content_rating,
    :budget, :imdb_score, :aspect_ratio, :fb_likes, :plot_keywords, :genres, :director_id,
    :actor_ids
  )

  validates :title, :budget, :genres, :director_id, :actor_ids, presence: true

  def movie_attributes
    {
      title: title,
      year: year,
      num_critic_for_reviews: num_critic_for_reviews,
      duration: duration,
      num_voted_users: num_voted_users,
      facenumber_in_poster: facenumber_in_poster,
      imdb_link: imdb_link,
      num_user_for_reviews: num_user_for_reviews,
      language: language,
      country: country,
      content_rating: content_rating,
      budget: budget,
      imdb_score: imdb_score,
      fb_likes: fb_likes,
      plot_keywords: parse_to_array(plot_keywords),
      genres: parse_to_array(genres),
      color: color
    }
  end

  private

  def parse_to_array(value)
    return [] unless value

    value.split(',')
  end
end
