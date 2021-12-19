class GoodsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    goods = current_user.goods
    render json: goods
  end

  def show
    render json: good
  end

  def create
    good = current_user.goods.build(good_params)
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
    if good.destroy
      head :no_content, status: :ok
    else
      render json: good.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def good
    @good ||= Good.find(params[:id])
  end

  def good_params
    params.require(:good).permit(:year, :content)
  end
end
