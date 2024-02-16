class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :rating, presence: true, numericality: { only_integer: true }
  validates :movie, uniqueness: { scope: :user }

  after_create :update_movie_average_rating

  def update_movie_average_rating
    MovieAverageRatingUpdateService.new(self).process_record
  end
end
