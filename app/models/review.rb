class Review < ApplicationRecord
  belongs_to :good
  belongs_to :author, class_name: 'User'
  has_many :gifts, as: :imageable, dependent: :destroy
  validates :grade, numericality: { in: 1..10 }
end
