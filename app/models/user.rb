class User < ApplicationRecord
  has_many :goods, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :karmas, dependent: :destroy # only for elfs
  has_many :invitations, dependent: :destroy # only for Dead_moroz
  validates :role, presence: true
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :age, presence: true
  enum role: { kid: 0, elf: 1, dead_moroz: 2 }
end
