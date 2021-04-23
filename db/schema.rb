# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_314_203_321) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'actors', force: :cascade do |t|
    t.string 'name'
    t.integer 'fb_likes'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'email'
  end

  create_table 'directors', force: :cascade do |t|
    t.string 'name'
    t.integer 'fb_likes'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'movies_count'
    t.bigint 'total_budget'
  end

  create_table 'movies', force: :cascade do |t|
    t.boolean 'color'
    t.integer 'num_critic_for_reviews'
    t.integer 'duration'
    t.bigint 'gross'
    t.string 'title'
    t.integer 'num_voted_users'
    t.integer 'facenumber_in_poster'
    t.string 'imdb_link'
    t.integer 'num_user_for_reviews'
    t.string 'language'
    t.string 'country'
    t.string 'content_rating'
    t.bigint 'budget'
    t.integer 'year'
    t.decimal 'imdb_score'
    t.decimal 'aspect_ratio'
    t.integer 'fb_likes'
    t.text 'plot_keywords'
    t.text 'genres'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'director_id'
    t.index ['director_id'], name: 'index_movies_on_director_id'
  end

  create_table 'movies_actors', force: :cascade do |t|
    t.bigint 'movie_id'
    t.bigint 'actor_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['actor_id'], name: 'index_movies_actors_on_actor_id'
    t.index ['movie_id'], name: 'index_movies_actors_on_movie_id'
  end

  add_foreign_key 'movies', 'directors'
  add_foreign_key 'movies_actors', 'actors'
  add_foreign_key 'movies_actors', 'movies'
end
