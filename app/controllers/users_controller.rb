class UsersController < ApiController
  def index
    users = User.all
    render json: users
  end

  def show
    render json: user
  end

  private

  def user
    @user ||= User.find(params[:id])
  end
end
