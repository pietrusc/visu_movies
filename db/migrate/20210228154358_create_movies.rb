class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.boolean :color
      t.integer :num_critic_for_reviews
      t.integer :duration
      t.bigint :gross
      t.string :title
      t.integer :num_voted_users
      t.integer :facenumber_in_poster
      t.string :imdb_link
      t.integer :num_user_for_reviews
      t.string :language
      t.string :country
      t.string :content_rating
      t.bigint :budget
      t.integer :release_year
      t.decimal :imdb_score
      t.decimal :aspect_ratio
      t.integer :fb_likes
      t.text :plot_keywords
      t.text :genres

      t.timestamps
    end
  end
end
