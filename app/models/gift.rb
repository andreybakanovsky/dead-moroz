class Gift < ApplicationRecord
  belongs_to :giftable, polymorphic: true
  belongs_to :good, -> { where(gifts: { giftable_type: 'Good' }) }, foreign_key: 'giftable_id'
  belongs_to :review, -> { where(gifts: { giftable_type: 'Review' }) }, foreign_key: 'giftable_id'
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  mount_uploaders :images, ImageUploader
end
