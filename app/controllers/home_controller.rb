class HomeController < ApplicationController
  def index
    @ideas = Idea.joins(:user).order("created_at DESC").includes([user: :profile]).page(params[:page]).per(6)
  end

end
