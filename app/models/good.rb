class Good < ApplicationRecord
  belongs_to :child, class_name: 'User', foreign_key: 'user_id', inverse_of: :goods
  has_many :reviews, dependent: :destroy
  has_many :requested_gifts, as: :giftable, class_name: 'Gift', dependent: :destroy

  validates :year, presence: true,
         numericality: { greater_than_or_equal_to: 2000, less_than_or_equal_to: proc { |_record| Date.current.year } }
  validates :content, length: { maximum: 1000 }
end
