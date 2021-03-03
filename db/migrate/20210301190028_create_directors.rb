class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :fb_likes

      t.timestamps
    end

    add_reference :movies, :director, index: true, foreign_key: true
  end
end
