class AddCountersToDirectors < ActiveRecord::Migration[5.2]
  def up
    add_column :directors, :movies_count, :integer
    add_column :directors, :total_budget, :bigint

    Director.find_each do |director|
      Director.reset_counters(director.id, :movies)
    end
  end
end
