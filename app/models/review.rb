class Review < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  validates :grade, numericality: { in: 1..10 }
end
