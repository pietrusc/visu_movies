class Movie < ApplicationRecord
  has_many :movies_actors, dependent: :destroy
  has_many :actors, through: :movies_actors

  belongs_to :director, optional: true, counter_cache: true

  serialize :genres, Array
  serialize :plot_keywords, Array
end
