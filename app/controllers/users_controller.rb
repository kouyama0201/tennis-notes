class UsersController < ApplicationController
  before_action :set_user

  def show
    if @user == current_user
      @log = @user.logs.page(params[:page]).per(6).order("created_at DESC")
    else
      @log = @user.logs.page(params[:page]).per(6).order("created_at DESC").where.not(status: "1")
    end
  end

  def like
    @like = @user.like_logs.page(params[:page]).per(6).order("created_at DESC")
  end

  def following
    @title = "フォロー"
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @users = @user.followers
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
