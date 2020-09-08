class ProfilesController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def show
    @profile = Profile.find(params[:id])
    user = @profile.user
    @ideas = Idea.where(user_id: user.id).order("created_at DESC").includes(:user).page(params[:page]).per(6)
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    profile.update(update_params)
    flsh[:success] = '変更が完了しました'
    redirect_to :action => "edit"
  end

  private
  def update_params
    params.require(:profile).permit(:nickname, :introduction, :avatar)
  end
  
  def correct_user
    @profile = Profile.find(params[:id])
    redirect_to(edit_profile_path(current_user.profile.id)) unless current_user?(@profile.user_id)
  end
end
