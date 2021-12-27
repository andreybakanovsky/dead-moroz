class InvitationsController < ApiController
  load_and_authorize_resource

  def index
    invitations = Invitation.all
    render json: invitations
  end

  def show
    render json: invitation
  end

  def create
    invitation = user.invitations.build(invitation_params)
    if invitation.save
      render json: invitation, status: :created
    else
      render json: invitation.errors, status: :unprocessable_entity
    end
  end

  def update
    if invitation.update(invitation_params)
      render json: invitation
    else
      render json: invitation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if invitation.destroy
      head :no_content, status: :ok
    else
      render json: invitation.errors, status: :unprocessable_entity
    end
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def invitation
    @invitation ||= user.invitations.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:email, :expire_at, :url, :status, :user_id)
  end
end
