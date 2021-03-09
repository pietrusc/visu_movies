class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :year, :color, :num_critic_for_reviews, :duration, :gross, :num_voted_users, :facenumber_in_poster,
             :imdb_link, :num_user_for_reviews, :language, :country, :content_rating, :budget, :imdb_score,
             :aspect_ratio, :fb_likes, :plot_keywords, :genres
  has_many :actors
  belongs_to :director
end
