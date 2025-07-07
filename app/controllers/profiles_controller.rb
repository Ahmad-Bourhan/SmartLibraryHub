class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_admin!, only: [:index]

  # Show the current user's profile
  def show
  end

  # Edit the current user's profile
  def edit
  end

  # Update the current user's profile
  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Admin only - view all profiles
  def index
    @users = User.all
  end
# Delete the current user's profile
def destroy
  current_user.destroy
  redirect_to root_path, notice: "Your profile and account were deleted successfully."
end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :phone, :eircode)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end
end
