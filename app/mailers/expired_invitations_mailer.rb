class ExpiredInvitationsMailer < ApplicationMailer
  def expired_invitation(invitations)
    @invitations = invitations

    mail to: dead_moroz_email, subject: 'Expired invitations'
  end

  private

  def dead_moroz_email
    User.find_by(role: :dead_moroz).email
  end
end
