class HomeController < ApplicationController
  def index
    @ideas = Ideas.includes(:user).order("created_at DESC")
  end

end
