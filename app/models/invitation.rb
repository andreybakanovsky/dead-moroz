class Invitation < ApplicationRecord
  attr_accessor :token

  EXPIRING_PERIOD = 3.days

  validates :status, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :email, presence: true

  enum status: { created: 0, sent: 1, seen: 2, accepted: 3, expire: 4 }

  def create_token
    self.token = SecureRandom.uuid
    save_digest
  end

  def digest
    BCrypt::Password.create(token)
  end

  def expire_date
    EXPIRING_PERIOD.from_now
  end

  def save_digest
    update(digest: digest)
  end
end
