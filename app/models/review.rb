class Review < ApplicationRecord
  belongs_to :good
  belongs_to :author, class_name: 'User'
  has_many :suggested_gifts, -> { where(giftable_type: :suggested) }, as: :giftable, class_name: 'Gift',
            dependent: :destroy, inverse_of: :giftable
  validates :grade, numericality: { in: 1..10 }
end
