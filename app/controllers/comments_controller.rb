class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(log_id: params[:log_id], user_id: current_user.id)
  end
end