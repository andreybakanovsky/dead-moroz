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

      def average_grade
        avrg = Review.includes(:good).where(goods: { user_id: params[:id] }).average(:grade)
        # avrg = Review.find_by_sql [
        #   'SELECT AVG(reviews.grade) FROM reviews
        #   LEFT OUTER JOIN goods ON goods.id = reviews.good_id WHERE goods.user_id = ?', params[:id]
        # ]
        render json: avrg
      end

      def good_years
        years = Good.select(:year).distinct.where(goods: { user_id: params[:id] }).order(year: :desc)
        render json: years
      end

      def requested_gifts
        suggested_gifts = Gift.find_by_sql [
          "SELECT gifts.id, gifts.name, gifts.description, gifts.images
          FROM gifts
          LEFT OUTER JOIN goods ON gifts.giftable_type = 'Good' AND goods.id = gifts.giftable_id AND goods.year = ?
          WHERE goods.user_id = ?", params[:year], params[:id]
        ]
        render json: suggested_gifts
      end

      def reviews
        reviews = Review.includes(:good).where(goods: { user_id: params[:id], year: params[:year] })
        render json: reviews
      end

      def suggested_gifts
        suggested_gifts = Gift.find_by_sql [
          "SELECT gifts.id, gifts.name, gifts.description, gifts.images, gifts.deads_choice FROM gifts
          LEFT OUTER JOIN reviews ON gifts.giftable_type = 'Review' AND reviews.id = gifts.giftable_id
          LEFT OUTER JOIN goods   ON goods.id = reviews.good_id     AND goods.year = ?
          WHERE goods.user_id = ?", params[:year], params[:id]
        ]
        render json: suggested_gifts
      end

      private

      def user
        @user ||= User.find(params[:id])
      end
    end
  end
end
