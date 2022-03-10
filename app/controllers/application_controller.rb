# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery unless: -> { request.format.json? }
  respond_to :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[password])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role name age])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name age avatar])
  end
end
