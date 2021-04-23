# frozen_string_literal: true

class MoviesActor < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
end
