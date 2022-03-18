module Api
  module V1
    class GiftsController < ApiController
      load_and_authorize_resource

      def index
        gifts = good.requested_gifts.accessible_by(current_ability).order(updated_at: :desc)
        render json: gifts
      end

      def show
        render json: @gift
      end

      def create
        gift = current_user_good.requested_gifts.build(gift_params)
        if gift.save
          render json: gift, status: :created
        else
          render json: gift.errors, status: :unprocessable_entity
        end
      end

      def update
        if gift.update(gift_params)
          render json: gift
        else
          render json: gift.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if gift.destroy
          head :no_content, status: :ok
        else
          render json: gift.errors, status: :unprocessable_entity
        end
      end

      private

      def user
        @user ||= User.find(params[:user_id])
      end

      def good
        @good ||= user.goods.find(params[:good_id])
      end

      def current_user_good
        @current_user_good ||= current_user.goods.find(params[:good_id])
      end

      def gift
        @gift ||= good.requested_gifts.find(params[:id])
      end

      def gift_params
        params.require(:gift).permit(:name, :description, :giftable_type, :giftable_id, { images: [] })
      end
    end
  end
end
