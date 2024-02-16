class ChangeFieldsInMovies < ActiveRecord::Migration[7.1]
  def up
    change_column :movies, :average_rating, :float
  end

  def down
    change_column :movies, :average_rating, :decimal
  end
end
