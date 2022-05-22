module InvitationServices
  class CheckExpire
    def self.call(...)
      new(...).execute
    end

    def execute
      @invitations = Invitation.where('status = ? and expire_at > ?', :sent, Data.current)
      ExpiredInvitationsMailer.expired_invitation(@invitations).deliver_now if @invitations.any?
    end
  end
end
