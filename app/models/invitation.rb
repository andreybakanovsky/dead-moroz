class Invitation < ApplicationRecord
  attr_accessor :token

  EXPIRING_PERIOD = 3.days

  enum status: { created: 0, sent: 1, accepted: 2, expired: 3 }

  validates :status, presence: true, inclusion: { in: Invitation.statuses }
  validates :email, presence: true

  def create_token
    self.token = SecureRandom.uuid # v4
    save_digest
  end

  def create_digest
    BCrypt::Password.create(token)
  end

  def expire_date
    EXPIRING_PERIOD.from_now
  end

  def save_digest
    update(digest: create_digest)
  end
end
