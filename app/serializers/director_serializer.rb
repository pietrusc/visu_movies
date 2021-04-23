# frozen_string_literal: true

class DirectorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :fb_likes, :total_budget, :movies_count
end
