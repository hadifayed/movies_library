class MovieActorLocation < ApplicationRecord
  belongs_to :movie
  belongs_to :location
  belongs_to :actor

  validates :movie, uniqueness: { scope: %i[actor location] }
end