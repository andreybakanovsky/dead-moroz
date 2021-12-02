class GiftsController < ApplicationController

  def index
    @gifts = Gift.all
  end

  def show; end

  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      redirect_to @gift, notice: 'Gift was successfully created.'
    else
      render :new
    end
  end

  def update
    if gift.update(gift_params)
      redirect_to gift, notice: 'Gift was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    gift.destroy
    redirect_to gifts_url, notice: 'Gift was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def gift
    @gift ||= Gift.find(params[:id])
  end
  helper_method :gift

  def gift_params
    params.require(:gift).permit(:name, :description, :deads_choice)
  end
end
