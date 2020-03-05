class LogsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_log, only: %i[edit show]

  def index
    @log = Log.includes(:user).page(params[:page]).per(9).order("created_at DESC")
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    if @log.valid?
      @log.save
      redirect_to root_path, notice: '投稿しました。'
    else
      render new_log_path(@log)
    end
  end

  def destroy
    log = Log.find(params[:id])
    if log.user_id == current_user.id && log.destroy
      redirect_back(fallback_location: root_path, notice: '投稿を削除しました。')
    else
      redirect_to root_path, alert: '投稿の削除に失敗しました。'
    end
  end

  def edit; end

  def update
    log = Log.find(params[:id])
    if log.user_id == current_user.id && log.update(log_params) 
      redirect_to root_path, notice: '投稿を更新しました。'
    else
      redirect_to root_path, alert: '投稿を更新できませんでした。'
    end
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
