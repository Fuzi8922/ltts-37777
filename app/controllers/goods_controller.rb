class GoodsController < ApplicationController

  def create
    if user_signed_in?
      @review = Review.find(params[:review_id]) 
      @good = current_user.goods.create(review_id: @review.id)
    else
      redirect_to root_path
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @good = Good.find_by(review_id: @review.id, user_id: current_user.id)
    @good.destroy
  end

end
