# frozen_string_literal: true

class NewsletterMailer < ApplicationMailer
  default to: -> { params[:email] }

  def new_movie_added(movie)
    @title = movie.title
    mail subject: 'New movie added'
  end
end
