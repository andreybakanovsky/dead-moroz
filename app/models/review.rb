class Review < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_many :gifts, as: :imageable, dependent: :destroy
  validates :grade, numericality: { in: 1..10 }
end
