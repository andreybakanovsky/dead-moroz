module Api
  module V1
    class GiftSuggestionsController < ApiController
      load_and_authorize_resource :gift, param_method: :gift_suggestions_params, parent: false

      def index
        gifts = review.suggested_gifts.accessible_by(current_ability)
        render json: gifts
      end

      def show
        render json: gift
      end

      def create
        gift = review.suggested_gifts.build(gift_suggestions_params)
        if gift.save
          render json: gift, status: :created
        else
          render json: gift.errors, status: :unprocessable_entity
        end
      end

      def update
        if gift.update(gift_suggestions_params)
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

      def review
        @review ||= good.reviews.find(params[:review_id])
      end

      def gifts
        @gifts ||= review.suggested_gifts
      end

      def gift
        @gift ||= review.suggested_gifts.find(params[:id])
      end

      def gift_suggestions_params
        params.require(:gift_suggestion).permit(:name, :description, :giftable_type, :giftable_id)
      end
    end
  end
end
