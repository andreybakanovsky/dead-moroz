class GoodsController < ApplicationController
  def index
    goods = Good.all
    render json: goods
  end

  def show
    render json: goods
  end

  def create
    good = Good.new(good_params)
    if good.save
      render json: good, status: :created
    else
      render json: good.errors, status: :unprocessable_entity
    end
  end

  def update
    if good.update(good_params)
      render json: good
    else
      render json: good.errors, status: :unprocessable_entity
    end
  end

  def destroy
    good.destroy
    if good.destroy
      head :no_content, status: :ok
    else
      render json: good.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def good
    good ||= Good.find(params[:id])
  end

  def good_params
    params.require(:good).permit(:year, :content, :user_id)
  end
end
