module Statistics
  class GoodYearsQuery
    def initialize(params)
      @params = params
    end

    def self.call(...)
      new(...).execute
    end

    def execute
      Good.select(:year).distinct.where(goods: { user_id: @params[:id] }).order(year: :desc)
    end
  end
end
