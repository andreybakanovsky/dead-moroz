class ReviewsController < ApiController
  def index
    reviews = Review.all
    render json: reviews
  end

  def show
    render json: review
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: review, status: :created
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def update
    if review.update(review_params)
      render json: review
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if review.destroy
      head :no_content, status: :ok
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  private

  def review
    @review ||= Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:grade, :comment, :user_id, :good_id)
  end
end
