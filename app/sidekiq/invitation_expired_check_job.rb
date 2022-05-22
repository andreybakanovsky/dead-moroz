class InvitationExpiredCheckJob
  include Sidekiq::Job

  def perform
    InvitationServices::CheckExpire.call
  end
end
