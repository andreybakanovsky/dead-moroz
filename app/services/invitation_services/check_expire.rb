module InvitationServices
  class CheckExpire
    def self.call(...)
      new(...).execute
    end

    def execute
      @invitations = Invitation.where('status = ? and expire_at > ?', :sent, Time.current)
      p "@invitations = #{@invitations}"
      ExpiredInvitationsMailer.expired_invitation(@invitations).deliver_now if @invitations.any?
    end
  end
end
