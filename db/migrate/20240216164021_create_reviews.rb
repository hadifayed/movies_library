class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :comment
      t.references :user, index: true, foreign_key: true, null: false
      t.references :movie, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
