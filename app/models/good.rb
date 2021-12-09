class Good < ApplicationRecord
  belongs_to :child, class_name: 'User'
  has_many :reviews, dependent: :destroy
  has_many :gifts, as: :imageable, dependent: :destroy
  validates :year, presence: true,
         numericality: { greater_than_or_equal_to: 2000, less_than_or_equal_to: proc { |_record| Date.current.year } }
  validates :content, length: { maximum: 500 }
end
