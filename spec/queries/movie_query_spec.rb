require 'rails_helper'

RSpec.describe MovieQuery do
  subject { described_class.new(params).results }

  context 'with sort by year param' do
    let(:params) do
      {"sort"=>"-year"}.with_indifferent_access
    end
    before do
      create(:movie, year: 1999)
      create(:movie, year: 2020)
      create(:movie, year: 2000)
    end

    it 'returns sorted movies' do
      expect(subject.map(&:year)).to eq([2020, 2000, 1999])
    end
  end

  context 'with actor_id filter' do
    let(:movies_actor) { create :movies_actor }
    let(:movies_actor2) { create :movies_actor }
    let(:actor_ids) { "#{movies_actor.actor_id}, #{movies_actor2.actor_id}"}
    let(:params) do
      { "filter"=>{"actor_id"=>actor_ids} }.with_indifferent_access
    end
    before do
      create :movies_actor
    end

    it 'returns filtered movies' do
      expect(subject.map(&:id)).to match_array([movies_actor.movie_id, movies_actor2.movie_id])
    end
  end
end
