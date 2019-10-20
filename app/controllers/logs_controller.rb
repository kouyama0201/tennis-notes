class LogsController < ApplicationController

  def index
    @log = Log.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @log = Log.new
  end

  def create
    Log.create(log_params)
    redirect_to root_path
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to root_path
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    log = Log.find(params[:id])
    log.update(log_params)
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