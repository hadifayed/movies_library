class Location < ApplicationRecord
  has_many :movie_actor_locations
  has_many :actors, -> { distinct }, through: :movie_actor_locations
  has_many :movies, -> { distinct }, through: :movie_actor_locations

  validates :name, presence: true
end
