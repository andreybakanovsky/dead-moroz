class Gift < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  validates :name, presence: true
  validates :desctiption, length: { maximum: 500 }
end
