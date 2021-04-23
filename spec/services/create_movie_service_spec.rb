# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateMovieService do
  include ActiveJob::TestHelper

  it 'creates movie' do
    director = create(:director, movies_count: 0, total_budget: nil)
    actor1 = create(:actor)
    actor2 = create(:actor)
    actor3 = create(:actor)
    params = {
      title: Faker::Movie.title,
      budget: 10,
      genres: 'Drama, Comedy',
      director_id: director.id,
      actor_ids: [actor1.id, actor2.id]
    }
    form = CreateMovieForm.new(params)

    expect { described_class.new(form).call }.to change(Movie, :count).by(1)
  end

  it 'creates movies actors' do
    director = create(:director, movies_count: 0, total_budget: nil)
    actor1 = create(:actor)
    actor2 = create(:actor)
    actor3 = create(:actor)
    params = {
      title: Faker::Movie.title,
      budget: 10,
      genres: 'Drama, Comedy',
      director_id: director.id,
      actor_ids: [actor1.id, actor2.id]
    }
    form = CreateMovieForm.new(params)

    expect { described_class.new(form).call }.to change(MoviesActor, :count).by(2)
  end

  it 'updates director movies count' do
    director = create(:director, movies_count: 0, total_budget: nil)
    actor1 = create(:actor)
    actor2 = create(:actor)
    actor3 = create(:actor)
    params = {
      title: Faker::Movie.title,
      budget: 10,
      genres: 'Drama, Comedy',
      director_id: director.id,
      actor_ids: [actor1.id, actor2.id]
    }
    form = CreateMovieForm.new(params)

    described_class.new(form).call
    director.reload

    expect(director.movies_count).to eq(1)
  end

  it 'sets director total_budget' do
    director = create(:director, movies_count: 0, total_budget: nil)
    actor1 = create(:actor)
    actor2 = create(:actor)
    actor3 = create(:actor)
    params = {
      title: Faker::Movie.title,
      budget: 10,
      genres: 'Drama, Comedy',
      director_id: director.id,
      actor_ids: [actor1.id, actor2.id]
    }
    form = CreateMovieForm.new(params)
    create(:movie, budget: 5, director: director)

    described_class.new(form).call
    director.reload

    expect(director.total_budget).to eq(15)
  end

  context 'with director total_budget present' do
    it 'updates director total_budget' do
      director = create(:director, movies_count: 0, total_budget: 10)
      actor1 = create(:actor)
      actor2 = create(:actor)
      actor3 = create(:actor)
      params = {
        title: Faker::Movie.title,
        budget: 10,
        genres: 'Drama, Comedy',
        director_id: director.id,
        actor_ids: [actor1.id, actor2.id]
      }
      form = CreateMovieForm.new(params)

      described_class.new(form).call
      director.reload

      expect(director.total_budget).to eq(20)
    end
  end

  it 'sends newsletter' do
    director = create(:director, movies_count: 0, total_budget: nil)
    actor1 = create(:actor)
    actor2 = create(:actor)
    actor3 = create(:actor)
    params = {
      title: Faker::Movie.title,
      budget: 10,
      genres: 'Drama, Comedy',
      director_id: director.id,
      actor_ids: [actor1.id, actor2.id]
    }
    form = CreateMovieForm.new(params)
    create_list(:customer, 5)

    perform_enqueued_jobs do
      expect { described_class.new(form).call }.to change { NewsletterMailer.deliveries.count }.by(5)
    end
  end
end
