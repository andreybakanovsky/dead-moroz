class KarmasController < ApplicationController
  def index
    karmas = Karma.all
    render json: karmas
  end

  def show
    render json: karmas
  end

  def create
    karma = Karma.new(karma_params)

    if karma.save
      render json: karma, status: :created
    else
      render json: karma.errors, status: :unprocessable_entity
    end
  end

  def update
    if karma.update(karma_params)
      render json: karma
    else
      render json: karma.errors, status: :unprocessable_entity
    end
  end

  def destroy
    karma.destroy
    if karma.destroy
      head :no_content, status: :ok
    else
      render json: karma.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def karma
    karma ||= Karma.find(params[:id])
  end

  def karma_params
    params.require(:karma).permit(:value, :user_id)
  end
end
