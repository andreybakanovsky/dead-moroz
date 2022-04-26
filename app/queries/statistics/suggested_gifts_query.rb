module Statistics
  class SuggestedGiftsQuery
    def initialize(params)
      @params = params
    end

    def self.call(...)
      new(...).execute
    end

    def execute
      Gift
        .select(:id, :name, :description, :images, :deads_choice)
        .joins(review: :good)  # these scopes see in the model Gift !!
        .where(goods: { user_id: @params[:id], year: @params[:year] })
        .order(created_at: :asc)
      # Gift.find_by_sql [
      #   "SELECT gifts.id, gifts.name, gifts.description, gifts.images, gifts.deads_choice
      # FROM gifts
      # INNER JOIN reviews ON reviews.id = gifts.giftable_id AND gifts.giftable_type = 'Review'
      # INNER JOIN goods ON goods.id = reviews.good_id
      # WHERE goods.user_id = ? AND goods.year = ?", @params[:id], @params[:year]
      # ]
    end
  end
end
