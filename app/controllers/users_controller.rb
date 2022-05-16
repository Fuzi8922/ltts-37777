class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :user_identify, only: [:edit,  :update, :show]

  def show
    @reviews = Review.includes(:@user).order(created_at: :desc)
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:review_id)
    @bookmarks = Review.find(bookmarks)
  end

  private

  def user_params
    params.require(:user).permit(:id, :nickname, :email, :image, :profile_text)
  end

  def user_identify
    @user = User.find(params[:id])
  end

end
