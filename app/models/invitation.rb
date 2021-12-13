class Invitation < ApplicationRecord
  belongs_to :dead_moroz, class_name: 'User', foreign_key: 'user_id', inverse_of: :invitations
  validates :status, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4 }
end
