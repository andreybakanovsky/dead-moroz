class Invitation < ApplicationRecord
  attr_accessor :token

  EXPIRING_PERIOD = 3.days

  enum status: { created: 0, sent: 1, accepted: 2, expired: 3 }

  validates :status, presence: true, inclusion: { in: Invitation.statuses }
  validates :email, presence: true
  validate :email, :email_cannot_used_if_taken_by_users

  before_save :downcase_email

  def create_token
    self.token = SecureRandom.uuid # v4
    save_digest
  end

  def expire_date
    EXPIRING_PERIOD.from_now
  end

  private

  def save_digest
    update(digest: create_digest)
  end

  def email_cannot_used_if_taken_by_users
    errors.add(:email, 'the email address has already been taken') if User.find_by(email: email.downcase).present?
  end

  def create_digest
    BCrypt::Password.create(token)
  end

  def downcase_email
    self.email = email.downcase
  end
end
