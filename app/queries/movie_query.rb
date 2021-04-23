# frozen_string_literal: true

class MovieQuery
  def initialize(params)
    @params = params
  end

  def results
    @results = Movie.all
    actor_filter
    order_results
    @results
  end

  private

  def order_results
    sort = 'id'
    direction = 'asc'
    if @params[:sort].present?
      direction = 'desc' if @params[:sort].start_with?('-')
      sort = @params[:sort].delete_prefix('-')
    end
    raise Errors::InvalidSortParam unless Movie.attribute_names.include?(sort)

    @results = @results.order(sort => direction)
  end

  def actor_filter
    return if @params[:filter].blank? || @params[:filter][:actor_id].blank?

    @results = @results.joins(:movies_actors).merge(MoviesActor.where(actor_id: @params[:filter][:actor_id].split(',')))
  end
end
