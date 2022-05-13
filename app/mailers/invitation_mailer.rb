class InvitationMailer < ApplicationMailer
  def user_invitation(invitation)
    @invitation = invitation
    @invitation_url = signup_by_invitation_url(@invitation.id,
                                               email: @invitation.email,
                                               some_magic: @invitation.token,
                                               name: @invitation.user_name).remove('/api/v1/authentication')
    mail to: invitation.email, subject: "The deaD Moroz's invitations"
  end
end
