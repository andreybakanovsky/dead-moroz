class InvitationMailer < ApplicationMailer
  def user_invitation(invitation)
    @invitation = invitation

    mail to: invitation.email, subject: "The deaD Moroz's invitations"
  end
end
