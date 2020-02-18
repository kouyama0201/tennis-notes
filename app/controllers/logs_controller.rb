class LogsController < ApplicationController
  before_action :set_log, only: %i[edit show]

  def index
    @log = Log.includes(:user).page(params[:page]).per(8).order("created_at DESC")
  end

  def new
    @log = Log.new
  end

  def create
    Log.create(log_params)
    redirect_to root_path, notice: '投稿しました。'
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy if log.user_id == current_user.id
    redirect_back(fallback_location: root_path, notice: '投稿を削除しました。')
  end

  def edit; end

  def update
    log = Log.find(params[:id])
    log.update(log_params) if log.user_id == current_user.id
    redirect_to root_path, notice: '投稿を更新しました。'
  end

  def show
    @graph = [@log.serve, @log.smash, @log.volley, @log.stroke, @log.game]
    @comment = Comment.new
    @comments = @log.comments.includes(:user)
  end

  private

  def log_params
    params.require(:log).permit(:serve, :smash, :volley, :stroke, :game, :text, :image, :practice_day).merge(user_id: current_user.id)
  end

  def set_log
    @log = Log.find(params[:id])
  end
end
