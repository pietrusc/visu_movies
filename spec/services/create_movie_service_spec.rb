require 'rails_helper'

RSpec.describe CreateMovieService do
  include ActiveJob::TestHelper

  subject { described_class.new(form).call }

  let!(:director) { create(:director, movies_count: 0, total_budget: nil) }
  let!(:actor1) { create(:actor) }
  let!(:actor2) { create(:actor) }
  let!(:actor3) { create(:actor) }
  let(:form) { CreateMovieForm.new(params) }
  let(:params) do
    {
        title: Faker::Movie.title,
        budget: 10,
        genres: "Drama, Comedy",
        director_id: director.id,
        actor_ids: [actor1.id, actor2.id]
    }
  end

  it 'creates movie' do
    expect { subject }.to change(Movie, :count).by(1)
  end

  it 'creates movies actors' do
    expect { subject }.to change(MoviesActor, :count).by(2)
  end

  it 'updates director movies count' do
    subject
    director.reload

    expect(director.movies_count).to eq(1)
  end

  it 'sets director total_budget' do
    create(:movie, budget: 5, director: director)
    subject
    director.reload

    expect(director.total_budget).to eq(15)
  end

  context 'with director total_budget present' do
    let!(:director) { create(:director, movies_count: 0, total_budget: 10) }

    it 'updates director total_budget' do
      subject
      director.reload

      expect(director.total_budget).to eq(20)
    end
  end

  it 'sends newsletter' do
    create_list(:customer, 5)

    perform_enqueued_jobs do
      expect { subject }.to change { NewsletterMailer.deliveries.count }.by(5)
    end
  end
end
