# frozen_string_literal: true

class Actor < ApplicationRecord
  has_many :movies_actors, dependent: :destroy
  has_many :movies, through: :movies_actors
end
