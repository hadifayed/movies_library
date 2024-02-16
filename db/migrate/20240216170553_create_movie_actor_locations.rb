class CreateMovieActorLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_actor_locations do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.index [:movie_id, :actor_id, :location_id], unique: true

      t.timestamps
    end
  end
end
