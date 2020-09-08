class ReviewsController < ApplicationController
  
  def create
    @review - Review.create(create_params)
    @idea = Idea.find(params[:idea_id])
    @reviews = @idea.reviews.joins(:user).includes(:user)
  end

  def destroy
    @idea = Idea.find(params[idea_id])
    review = @idea.reviews.find(params[:id])
    if review.user_id == current_user.id
      review.destroy
    end
    @reviews = @idea.reviews.joins(:user).includes(:user)
  end

  private

  def create_params
    params.require(:review).permit(:comment).merge(user_id: current_user.id,idea_id: params[:idea_id])
  end

end
