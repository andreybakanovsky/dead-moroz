module Api
  module V1
    class KarmasController < ApiController
      load_and_authorize_resource

      def show
        render json: karma
      end

      private

      def user
        @user ||= User.find(params[:user_id])
      end

      def karma
        @karma ||= user.karma
      end
    end
  end
end
