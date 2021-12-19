module Users
  class ProfilesController < ApplicationController
    def show
      render json: current_user
    end
  end
end
