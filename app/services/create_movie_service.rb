class CreateMovieService
  attr_reader :movie, :error
  def initialize(form)
    @form = form
  end

  def call
    transaction_with_error_handling do
      @movie = Movie.create!(@form.movie_attributes.merge(director: director))
      add_movie_actors
      update_total_budget
      send_newsletter
    end
  end

  private

  def transaction_with_error_handling
    ActiveRecord::Base.transaction do
      yield
    end
  rescue StandardError => error
    @error = error
    false
  end

  def director
    @director ||= Director.find(@form.director_id)
  end

  def add_movie_actors
    @form.actor_ids.each do |actor_id|
      MoviesActor.create!(actor: Actor.find(actor_id), movie: @movie)
    end
  end

  def update_total_budget
    total_budget = if director.total_budget.present?
                     director.total_budget + @movie.budget
                   else
                     director.movies.sum(:budget)
                   end
    director.update!(total_budget: total_budget)
  end

  def send_newsletter
    true
  end
end
