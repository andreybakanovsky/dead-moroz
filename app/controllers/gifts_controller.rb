class GiftsController < ApplicationController
  def index
    gifts = Gift.all
    render json: gifts
  end

  def show
    render json: gift
  end

  def create
    gift = Gift.new(gift_params)
    if gift.save
      render json: gift, status: :created
    else
      render json: gift.errors, status: :unprocessable_entity
    end
  end

  def update
    if gift.update(gift_params)
      render json: gift
    else
      render json: gift.errors, status: :unprocessable_entity
    end
  end

  def destroy
    gift.destroy
    if gift.destroy
      head :no_content, status: :ok
    else
      render json: gift.errors, status: :unprocessable_entity
    end
  end

  private

  def gift
    gift ||= Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :description, :deads_choice)
  end
end
