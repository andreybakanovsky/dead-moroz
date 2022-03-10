module Api
  module V1
    class GoodsController < ApiController
      load_and_authorize_resource

      def index
        goods = user.goods.accessible_by(current_ability).order(year: :desc)
        render json: goods
      end

      def show
        render json: good
      end

      def create
        good = current_user.goods.build(good_params)
        if good.save
          render json: good, status: :created
        else
          render json: good.errors, status: :unprocessable_entity
        end
      end

      def update
        if good.update(good_params)
          render json: good
        else
          render json: good.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if good.destroy
          head :no_content, status: :ok
        else
          render json: good.errors, status: :unprocessable_entity
        end
      end

      private

      def user
        @user ||= User.find(params[:user_id])
      end

      def good
        @good ||= Good.find(params[:id])
      end

      def good_params
        params.require(:good).permit(:year, :content, { images: [] })
      end
    end
  end
end
