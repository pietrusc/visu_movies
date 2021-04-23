# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieQuery do
  context 'with sort by year param' do
    params = { 'sort' => '-year' }.with_indifferent_access

    it 'returns sorted movies' do
      create(:movie, year: 1999)
      create(:movie, year: 2020)
      create(:movie, year: 2000)

      expect(described_class.new(params).results.map(&:year)).to eq([2020, 2000, 1999])
    end
  end

  context 'with actor_id filter' do
    it 'returns filtered movies' do
      movies_actor = create :movies_actor
      movies_actor2 = create :movies_actor
      actor_ids = "#{movies_actor.actor_id}, #{movies_actor2.actor_id}"
      params = { 'filter' => { 'actor_id' => actor_ids } }.with_indifferent_access
      create :movies_actor
      
      expect(described_class.new(params).results.map(&:id)).to match_array([movies_actor.movie_id, movies_actor2.movie_id])
    end
  end
end
