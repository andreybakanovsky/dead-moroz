class Gift < ApplicationRecord
  belongs_to :giftable, polymorphic: true
  validates :name, presence: true
  validates :desctiption, length: { maximum: 500 }
end
