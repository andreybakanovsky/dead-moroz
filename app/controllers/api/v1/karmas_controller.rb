module Api
  module V1
    class KarmasController < ApiController
      load_and_authorize_resource

      def show
        render json: karma
      end

      def approved_gifts
        approved_gifts = ApprovedGifts.call(params)
        render json: approved_gifts
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
