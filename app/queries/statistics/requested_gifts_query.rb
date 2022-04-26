module Statistics
  class RequestedGiftsQuery
    def initialize(params)
      @params = params
    end

    def self.call(...)
      new(...).execute
    end

    def execute
      Gift
        .select(:id, :name, :description, :images)
        .joins(:good)  # this scope see in the model Gift
        .where(goods: { user_id: @params[:id], year: @params[:year] })
        .order(updated_at: :desc)
      # Gift.find_by_sql [
      #   "SELECT gifts.id, gifts.name, gifts.description, gifts.images
      #   FROM gifts
      #   INNER JOIN goods
      #   ON gifts.giftable_type = 'Good' AND goods.id = gifts.giftable_id
      #   WHERE goods.year = ? AND goods.user_id = ?", @params[:year], @params[:id]
      # ]
    end
  end
end
