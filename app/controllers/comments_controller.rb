class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'コメントしました。') }
      format.json
    end
  end

  def destroy
    @log = Log.find(params[:log_id])
    @comment = @log.comments.find(params[:id])
    @comment.destroy
    redirect_to log_path(@log), notice: 'コメントを削除しました。'
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(log_id: params[:log_id], user_id: current_user.id)
  end
end