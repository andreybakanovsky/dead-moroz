module Api
  module V1
    class ReviewsController < ApiController
      load_and_authorize_resource

      def index
        reviews = if current_user.dead_moroz?
                    good.reviews.order(created_at: :asc)
                  else
                    good.reviews.kept.order(created_at: :asc)
                  end
        render json: reviews
      end

      def show
        render json: review
      end

      def create
        review = good.reviews.build(review_params)
        review.user_id = current_user.id

        if review.save
          render json: review, status: :created
        else
          render json: review.errors, status: :unprocessable_entity
        end
      end

      def update
        if review.update(review_params)
          render json: review
        else
          render json: review.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if review.discard
          head :no_content, status: :ok
        else
          render json: review.errors, status: :unprocessable_entity
        end
      end

      def undiscard
        if review.undiscard
          head :no_content, status: :ok
        else
          render json: review.errors, status: :unprocessable_entity
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
        @review ||= good.reviews.find(params[:id]) # +
      end

      def review_params
        params.require(:review).permit(:grade, :comment, :good_id, :user_id)
      end
    end
  end
end
