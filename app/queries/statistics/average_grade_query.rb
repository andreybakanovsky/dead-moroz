module Statistics
  class AverageGradeQuery < ::BaseQuery
    def execute
      Review.joins(:good).where(goods: { user_id: @params[:id] }).average(:grade)
      # Review.find_by_sql [
      #   'SELECT AVG(reviews.grade) FROM reviews
      #    INNER JOIN goods
      #    ON goods.id = reviews.good_id
      #    WHERE goods.user_id = ?', params[:id]
      # ]
    end
  end
end
