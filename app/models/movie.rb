class Movie < ApplicationRecord
  has_many :movie_actor_locations
  has_many :actors, -> { distinct }, through: :movie_actor_locations
  has_many :locations, -> { distinct }, through: :movie_actor_locations

  validates :name, presence: true, uniqueness: true

  # overriding the original method to enable locking only when the average_rating field is changed 
  def locking_enabled?
    super && persisted? && average_rating_changed?
  end  
end
