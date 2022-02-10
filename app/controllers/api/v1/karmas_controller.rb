module Api
  module V1
    class KarmasController < ApiController
      load_and_authorize_resource

      def index
        karmas = user.karmas.accessible_by(current_ability)
        render json: karmas
      end

      def show
        render json: karma
      end

      def create
        karma = user.karmas.build(karma_params)

        if karma.save
          render json: karma, status: :created
        else
          render json: karma.errors, status: :unprocessable_entity
        end
      end

      def update
        if karma.update(karma_params)
          render json: karma
        else
          render json: karma.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if karma.destroy
          head :no_content, status: :ok
        else
          render json: karma.errors, status: :unprocessable_entity
        end
      end

      private

      def user
        @user ||= User.find(params[:user_id])
      end

      def karma
        @karma ||= user.karmas.find(params[:id])
      end

      def karma_params
        params.require(:karma).permit(:value, :user_id)
      end
    end
  end
end
