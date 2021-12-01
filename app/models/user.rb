class User < ApplicationRecord
  has_many :goods, dependent: :destroy
  validates :role, presence: true
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  enum role: { kid: 0, elf: 1, dead_moroz: 2 }
end
