class Karma < ApplicationRecord
  belongs_to :elf, class_name: 'User', foreign_key: 'user_id', inverse_of: :karma
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
