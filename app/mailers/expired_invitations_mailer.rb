class ExpiredInvitationsMailer < ApplicationMailer
  def expired_invitation(expired_invitations_ids)
    @invitations_ids = Invitation.where(id: expired_invitations_ids)

    mail to: dead_moroz_email, subject: 'Expired invitations'
  end

  private

  def dead_moroz_email
    User.find_by(role: :dead_moroz).email
  end
end
