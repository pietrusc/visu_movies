class MoviesController < ApplicationController
  def index
    results = MovieQuery.new(movies_params).results

    options = {}
    options[:include] = movies_params[:include].split(",")
    render json: MovieSerializer.new(results, options).serialized_json
  rescue StandardError => e
    render json: { error: e.message, status: 400 }, status: :bad_request
  end

  private

  def movies_params
    params.permit(:include, :sort, filter: [:actor_id])
  end
end
