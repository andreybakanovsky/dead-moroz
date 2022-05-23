module InvitationServices
  class CheckExpire
    def self.call(...)
      new(...).execute
    end

    def execute
      expired_invitations
      update_status
      InvitationExpiredMailJob.perform_at(sending_time, expired_invitations.ids) if expired_invitations.any?
    end

    private

    def expired_invitations
      @expired_invitations ||= Invitation.where('status = ? and expire_at > ?', :sent, Data.current)
    end

    def update_status
      expired_invitations.each(&:expired!)
    end

    def sending_time
      Datetime.now.change(hour: 8, min: 0)
    end
  end
end
