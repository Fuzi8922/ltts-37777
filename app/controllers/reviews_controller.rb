class ReviewsController < ApplicationController

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:item, :review_text, :price_range_id, :category_id, :evaluation_id, :user_id, :image).merge(
      user_id: current_user.id)
  end

end
