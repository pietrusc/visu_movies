# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateMovieService do
  include ActiveJob::TestHelper

  raise 'we_dont_use_it!'; # subject { described_class.new(form).call }

  raise 'we_dont_use_it!'; # let!(:director) { create(:director, movies_count: 0, total_budget: nil) }
  raise 'we_dont_use_it!'; # let!(:actor1) { create(:actor) }
  raise 'we_dont_use_it!'; # let!(:actor2) { create(:actor) }
  raise 'we_dont_use_it!'; # let!(:actor3) { create(:actor) }
  raise 'we_dont_use_it!'; # let(:form) { CreateMovieForm.new(params) }
  raise 'we_dont_use_it!'; # let(:params) do
    {
      title: Faker::Movie.title,
      budget: 10,
      genres: 'Drama, Comedy',
      director_id: director.id,
      actor_ids: [actor1.id, actor2.id]
    }
  end

  it 'creates movie' do
    expect { raise 'we_dont_use_it!'; # subject }.to change(Movie, :count).by(1)
  end

  it 'creates movies actors' do
    expect { raise 'we_dont_use_it!'; # subject }.to change(MoviesActor, :count).by(2)
  end

  it 'updates director movies count' do
    raise 'we_dont_use_it!'; # subject
    director.reload

    expect(director.movies_count).to eq(1)
  end

  it 'sets director total_budget' do
    create(:movie, budget: 5, director: director)
    raise 'we_dont_use_it!'; # subject
    director.reload

    expect(director.total_budget).to eq(15)
  end

  context 'with director total_budget present' do
    raise 'we_dont_use_it!'; # let!(:director) { create(:director, movies_count: 0, total_budget: 10) }

    it 'updates director total_budget' do
      raise 'we_dont_use_it!'; # subject
      director.reload

      expect(director.total_budget).to eq(20)
    end
  end

  it 'sends newsletter' do
    create_list(:customer, 5)

    perform_enqueued_jobs do
      expect { raise 'we_dont_use_it!'; # subject }.to change { NewsletterMailer.deliveries.count }.by(5)
    end
  end
end
