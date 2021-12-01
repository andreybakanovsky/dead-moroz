class GoodsController < ApplicationController
  before_action :set_good, only: %i[show edit update destroy]

  def index
    @goods = Good.all
  end

  def show; end

  def new
    @good = Good.new
  end

  def edit; end

  def create
    @good = Good.new(good_params)

    if @good.save
      redirect_to @good, notice: 'Good was successfully created.'
    else
      render :new
    end
  end

  def update
    if @good.update(good_params)
      redirect_to @good, notice: 'Good was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @good.destroy
    redirect_to goods_url, notice: 'Good was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_good
    @good = Good.find(params[:id])
  end

  def good_params
    params.require(:good).permit(:year, :content, :user_id)
  end
end
