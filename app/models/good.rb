class Good < ApplicationRecord
  belongs_to :user
  validates :year, presence: true,
         numericality: { greater_than: 2000, less_than_or_equal_to: proc { |_record| Date.current.year } }
  validates :content, length: { maximum: 500 }
end
