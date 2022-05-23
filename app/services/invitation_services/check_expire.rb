module InvitationServices
  class CheckExpire
    def self.call(...)
      new(...).execute
    end

    def execute
      @expired_invitations = Invitation.where('status = ? and expire_at > ?', :sent, Data.current)
      return unless expired_invitations.any? do
        update_status
        InvitationExpiredMailJob.perform_at(sending_time, @expired_invitations)
      end
    end

    def update_status
      @expired_invitations.each(&:expired!)
    end

    def sending_time
      Datetime.now.change(hour: 8, min: 0)
    end
  end
end
