# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        def create
          user = User.new sign_up_params
          if user.save
            render json: user, status: :created
          else
            warden.custom_failure!
            render json: user.errors, status: :unprocessable_entity
          end
        end

        def destroy
          if user.destroy
            head :no_content, status: :ok
          else
            render json: user.errors, status: :unprocessable_entity
          end
        end

        def update
          super
          user = current_user
          if user.update_without_password account_update_params
            head :no_content, status: :ok
          else
            render json: user.errors, status: :unprocessable_entity
          end
        end

        protected

        def sign_up_params
          params.require(:user).permit(:name, :age, :email, :password, :password_confirmation)
        end

        def account_update_params
          params.require(:user).permit(:name, :age)
        end

        def update_resource(resource, params)
          resource.update_without_password(params)
        end
      end
    end
  end
end
