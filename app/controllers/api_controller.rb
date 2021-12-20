class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  helper_method :current_user
end
