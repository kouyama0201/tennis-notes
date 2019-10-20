class LogsController < ApplicationController

  def index
    @log = Log.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @log = Log.new
  end

  def create
    Log.create(serve: log_params[:serve], smash: log_params[:smash], volley: log_params[:volley], stroke: log_params[:stroke], game: log_params[:game], text: log_params[:text], image: log_params[:image], user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy if log.user_id === current_user.id
    redirect_to root_path
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    log = Log.find(params[:id])
    log.update(log_params) if log.user_id == current_user.id
    redirect_to root_path
  end

  def show
    @log = Log.find(params[:id])
  end

  private
  def log_params
    params.require(:log).permit(:serve, :smash, :volley, :stroke, :game, :text, :image)
  end
end