class InvitationExpiredMailJob
  include Sidekiq::Job

  def perform(expired_invitations_ids)
    ExpiredInvitationsMailer.expired_invitation(expired_invitations_ids).deliver_now
  end
end
