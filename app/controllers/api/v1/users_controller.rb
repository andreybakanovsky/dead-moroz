module Api
  module V1
    class UsersController < ApiController
      load_and_authorize_resource

      def index
        users = User.accessible_by(current_ability).page(params[:page]).per(params[:page_size])
        render json: { users: users, metadata: { records_count: User.count } }
      end

      def show
        render json: user
      end

      def destroy
        if user.destroy
          head :no_content, status: :ok
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def average_grade
        avrg = Statistics::AverageGradeQuery.call(params)
        render json: avrg
      end

      def good_years
        years = Statistics::GoodYearsQuery.call(params)
        render json: years
      end

      def requested_gifts
        requested_gifts = Statistics::RequestedGiftsQuery.call(params)
        render json: requested_gifts
      end

      def reviews
        reviews = Statistics::ReviewsQuery.call(params)
        render json: reviews
      end

      def suggested_gifts
        suggested_gifts = Statistics::SuggestedGiftsQuery.call(params)
        render json: suggested_gifts
      end

      private

      def user
        @user ||= User.find(params[:id])
      end
    end
  end
end
