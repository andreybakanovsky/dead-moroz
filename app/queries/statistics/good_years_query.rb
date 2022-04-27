module Statistics
  class GoodYearsQuery < Statistics::BaseQuery
    def execute
      Good.select(:year).distinct.where(goods: { user_id: @params[:id] }).order(year: :desc)
    end
  end
end
