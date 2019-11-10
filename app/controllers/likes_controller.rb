class LikesController < ApplicationController
  before_action :set_log

  def create
    @like  = Like.create(user_id: current_user.id, log_id: params[:log_id])
    @likes = Like.where(log_id: params[:log_id])
    @log.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, log_id: params[:log_id])
    like.destroy
    @likes = Like.where(log_id: params[:log_id])
    @log.reload
  end

  private
  def set_log
    @log = Log.find(params[:log_id])
  end
end