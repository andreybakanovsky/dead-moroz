class InvitationExpiredMailJob
  include Sidekiq::Job

  def perform(expired_invitations)
    ExpiredInvitationsMailer.expired_invitation(expired_invitations).deliver_now
  end
end
