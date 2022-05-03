class ApprovedGifts < BaseQuery
  def execute
    reviews_approved_gifts =
      Review
      .select('reviews.id')
      .joins("INNER JOIN gifts ON gifts.giftable_type = 'Review' AND reviews.id = gifts.giftable_id")
      .where(gifts: { deads_choice: true })
      .joins('INNER JOIN users ON reviews.user_id = users.id')
      .where(users: { id: @params[:user_id] })

    Gift
      .select('users.id AS users_id, users.name AS users_name')
      .select('goods.year')
      .select('gifts.id, gifts.name AS gifts_name, gifts.description, gifts.images')
      .where(gifts: { deads_choice: true })
      .joins("INNER JOIN reviews ON gifts.giftable_type = 'Review' AND reviews.id = gifts.giftable_id")
      .where(reviews: { id: reviews_approved_gifts })
      .joins('INNER JOIN goods ON reviews.good_id = goods.id')
      .joins('INNER JOIN users ON goods.user_id = users.id')

    # in this case we can't get gifts images url by mount_uploaders:
    # User
    #   .select(:id, :name)
    #   .select('goods.year')
    #   .select('gifts.id AS gift_id, gifts.description, gifts.images AS gift_images')
    #   .joins(goods: :reviews)
    #   .where(reviews: { id: reviews_approved_gifts })
    #   .joins("INNER JOIN gifts ON gifts.giftable_type = 'Review' AND reviews.id = gifts.giftable_id")
    #   .where(gifts: { deads_choice: true })
  end
end
