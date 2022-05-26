module Statistics
  class ReviewsQuery < ::BaseQuery
    def execute
      Review.joins(:good).kept.where(goods: { user_id: @params[:id], year: @params[:year] })
      # Review.find_by_sql [
      #   "SELECT reviews.* FROM reviews
      #    INNER JOIN goods ON goods.id = reviews.good_id
      #    WHERE goods.user_id = ? AND goods.year = ?", @params[:id], @params[:year]
      # ]
    end
  end
end
