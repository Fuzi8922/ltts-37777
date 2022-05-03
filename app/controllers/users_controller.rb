class UsersController < ApplicationController

  before_action :user_identify, only: [:edit,  :update, :show]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:id, :nickname, :email, :image, :profile_text)
  end

  def user_identify
    @user = User.find(params[:id])
  end

end
