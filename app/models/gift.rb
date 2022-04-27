class Gift < ApplicationRecord
  belongs_to :giftable, polymorphic: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  mount_uploaders :images, ImageUploader
end
