class KarmasController < ApplicationController
  before_action :set_karma, only: [:show, :edit, :update, :destroy]

  def index
    @karmas = Karma.all
  end

  def show
  end

  def new
    @karma = Karma.new
  end

  def edit
  end

  def create
    @karma = Karma.new(karma_params)

    if @karma.save
      redirect_to @karma, notice: 'Karma was successfully created.'
    else
      render :new
    end
  end

  def update
    if @karma.update(karma_params)
      redirect_to @karma, notice: 'Karma was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @karma.destroy
    redirect_to karmas_url, notice: 'Karma was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_karma
      @karma = Karma.find(params[:id])
    end

    def karma_params
      params.require(:karma).permit(:value, :user_id)
    end
end
