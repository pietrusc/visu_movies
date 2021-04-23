# frozen_string_literal: true

class CreateMoviesActors < ActiveRecord::Migration[5.2]
  def change
    create_table :movies_actors do |t|
      t.references :movie, foreign_key: true, index: true
      t.references :actor, foreign_key: true, index: true

      t.timestamps
    end
  end
end
