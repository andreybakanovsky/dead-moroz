class OwnerSuggestedGift < BaseQuery
  def execute
    User.find_by_sql [
      "SELECT users.* FROM users
       INNER JOIN reviews ON reviews.user_id = users.id
       INNER JOIN gifts ON gifts.giftable_id = reviews.id AND gifts.giftable_type = 'Review'
       WHERE gifts.id = ?", @params[:id]
    ]
  end
end
