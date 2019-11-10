class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @log = user.logs.page(params[:page]).per(5).order("created_at DESC")
  end
end