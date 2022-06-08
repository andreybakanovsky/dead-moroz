class Gift < ApplicationRecord
  include Searchable

  mapping dynamic: 'false' do
    indexes :name, type: :keyword
    indexes :description, type: :text
    indexes :deads_choice, type: :keyword
  end

  belongs_to :giftable, polymorphic: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  mount_uploaders :images, ImageUploader
end
