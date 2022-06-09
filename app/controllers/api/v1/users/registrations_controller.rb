# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        def create
          return head :not_found if params[:invitation_id].present? && !invitation_valid?

          user = User.new sign_up_params
          if user.save
            invitation.accepted! if params[:invitation_id].present? && invitation_valid?
            render json: user, status: :created
          else
            warden.custom_failure!
            render json: user.errors, status: :unprocessable_entity
          end
        end

        def destroy
          user = current_user
          if user.destroy
            head :no_content, status: :ok
          else
            render json: user.errors, status: :unprocessable_entity
          end
        end

        def update
          user = current_user
          if user.update_without_password account_update_params
            head :no_content, status: :ok
          else
            render json: user.errors, status: :unprocessable_entity
          end
        end

        def check_invitation
          if invitation_valid?
            head :ok
          else
            head :not_found
          end
        end

        protected

        def invitation
          @invitation ||= Invitation.find(params[:invitation_id])
        end

        def invitation_valid?
          @invitation_valid ||=
            BCrypt::Password.new(invitation.digest) == params[:invitation_token] &&
            invitation.email == params[:email] &&
            Date.current <= invitation.expire_at &&
            invitation.sent?
        end

        def sign_up_params
          params.require(:user).permit(:role, :name, :age, :email, :password, :password_confirmation)
        end

        def account_update_params
          params.require(:user).permit(:name, :age, :avatar)
        end

        def update_resource(resource, params)
          resource.update_without_password(params)
        end
      end
    end
  end
end
