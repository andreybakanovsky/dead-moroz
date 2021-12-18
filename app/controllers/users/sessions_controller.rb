# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :ensure_params_exist

  def create
    build_resource
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in('user', resource)

      render json: resource, status: :created
      return
    else
      render json: { error: 'Sign in not successful' }, status: :unprocessable_entity
    end
    invalid_login_attempt
  end

  def destroy
    sign_out(resource_name)
  end

  protected

  def ensure_params_exist
    return if params[:user].present?

    render json: { success: false, message: 'Missing user parameter' }, status: :unprocessable_entity # 422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render json: { success: false, message: 'Error with your login or password' },
           status: :unauthorized
  end
end
