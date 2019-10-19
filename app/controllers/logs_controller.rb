class LogsController < ApplicationController

  def index
    @log = Log.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @log = Log.new
  end

  def create
    Log.create(log_params)
  end

  private
  def log_params
    params.require(:log).permit(:serve, :smash, :volley, :stroke, :game, :text, :image)
  end
end