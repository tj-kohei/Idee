class IdeasController < ApplicationController

  before_action :set_idea, only: [:show, :edit, :update, :destory]
  before_action :correct_user, only: [:edit, :update]
  def show
    @review = Review.new
    @reviews = @idea.reviews.joins(:user).includes(:user)
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if params[:back]
      render :new
    elsif @idea.save
      flash[:sucsses] = '投稿が完了しました'
      redirect_to controller: :home, action: :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    @idea.update(idea_params)
    flash[:sucsses] = '更新が完了しました'
    redirect_to controller: :ideas, action: :show
      else
        render :edit
    end
  end

  def destroy
   if @idea.user_id == current_user.id
      @idea.destroy
   end
   redirect_to controller: :home, action: :index
   flash[:sucsses] = '削除が完了しました'
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :category, :detail, :cue, :feature, :point, :remark, :figure).merge(user_id: current_user.id)
  end

  def correct_user
    redirect_to(root_path) unless current_user?(@idea.user_id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

end
