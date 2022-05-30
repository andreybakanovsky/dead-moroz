class Review < ApplicationRecord
  include Discard::Model
  include Searchable

  belongs_to :good
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', inverse_of: :reviews
  has_many :suggested_gifts, as: :giftable, class_name: 'Gift', dependent: :destroy

  validates :grade, presence: true,
             numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :comment, length: { maximum: 1000 }
end
