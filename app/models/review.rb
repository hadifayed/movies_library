class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  
  validates :rating, presence: true, numericality: { only_integer: true }
end
