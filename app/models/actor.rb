class Actor < ApplicationRecord
  has_many :movie_actor_locations
  has_many :movies, -> { distinct }, through: :movie_actor_locations
  has_many :locations, -> { distinct }, through: :movie_actor_locations

  validates :name, presence: true, uniqueness: true
end
