class AddFieldsToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :average_rating, :decimal, default: 0
    add_column :movies, :reviews_count, :integer, default: 0
    add_column :movies, :lock_version, :integer, default: 0, null: false
  end
end
