class MoviesController < ApplicationController
  def index
    results = MovieQuery.new(movies_params).results

    options = {}
    options[:include] = movies_params[:include].split(",")
    render json: MovieSerializer.new(results, options).serialized_json
  rescue StandardError => e
    render json: { error: e.message, status: 400 }, status: :bad_request
  end

  def create
    form = CreateMovieForm.new(movie_params)
    render json: { error: form.errors.full_messages, status: 400 }, status: :bad_request and return unless form.valid?

    service = CreateMovieService.new(form)
    if service.call
      options = {}
      options[:include] = ['director', 'actors']
      render json: MovieSerializer.new(service.movie, options).serialized_json
    else
      render json: { error: service.error, status: 422 }, status: :unprocessable_entity
    end
  end

  private

  def movies_params
    params.permit(:include, :sort, filter: [:actor_id])
  end

  def movie_params
    params.from_jsonapi.require(:movie).permit(Movie.attribute_names - ["id", "created_at", "updated_at"], actor_ids: [])
  end
end
