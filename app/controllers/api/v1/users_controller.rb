module Api
  module V1
    class UsersController < ApiController
      load_and_authorize_resource

      def index
        users = User.accessible_by(current_ability)
        render json: users
      end

      def show
        render json: user
      end

      private

      def user
        @user ||= User.find(params[:id])
      end
    end
  end
end
