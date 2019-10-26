class LogsController < ApplicationController

  def index
    @log = Log.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @log = Log.new
  end

  def create
    Log.create(log_params)
    redirect_to root_path, notice: '投稿しました'
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy if log.user_id === current_user.id
    redirect_to root_path, notice: '投稿を削除しました'
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    log = Log.find(params[:id])
    log.update(log_params) if log.user_id == current_user.id
    redirect_to root_path, notice: '投稿を更新しました'
  end

  def show
    @log = Log.find(params[:id])
    gon.serve = @log.serve
    gon.smash = @log.smash
    gon.volley = @log.volley
    gon.stroke = @log.stroke
    gon.game = @log.game
    @comment = Comment.new
    @comments = @log.comments.includes(:user)
  end

  private
  def log_params
    params.require(:log).permit(:serve, :smash, :volley, :stroke, :game, :text, :image).merge(user_id: current_user.id)
  end

end