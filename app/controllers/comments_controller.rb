class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :identify_review

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to review_path(@review)
    else
      render review_path(@review)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to review_path(@review)
    else
      render review_path(@review)
    end
  end

  private

  def identify_review
    @review = Review.find(params[:review_id])
  end

  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, review_id: params[:review_id])
  end

end
