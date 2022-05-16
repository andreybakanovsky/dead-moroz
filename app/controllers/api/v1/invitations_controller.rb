module Api
  module V1
    class InvitationsController < ApiController
      load_and_authorize_resource

      def index
        invitations = Invitation.all.order(id: :desc)
        render json: invitations
      end

      def show
        render json: invitation
      end

      def create
        invitation = Invitation.new(invitation_params)
        if invitation.save
          render json: invitation, status: :created
        else
          render json: invitation.errors, status: :unprocessable_entity
        end
      end

      def send_by_email
        invitation.create_token
        InvitationMailer.user_invitation(invitation).deliver_now
        invitation.update(status: :sent, expire_at: invitation.expire_date)
        invitation.save
      end

      def update
        if invitation.update(invitation_params)
          render json: invitation
        else
          render json: invitation.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if invitation.destroy
          head :no_content, status: :ok
        else
          render json: invitation.errors, status: :unprocessable_entity
        end
      end

      private

      def invitation
        @invitation ||= invitations.find(params[:id])
      end

      def invitation_params
        params.require(:invitation).permit(:email, :expire_at, :user_name, :status)
      end
    end
  end
end
