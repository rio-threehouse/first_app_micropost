class CommentsController < ApplicationController
  before_action :require_user_logged_in

  def create
    comment = current_user.comments.build(comment_params)
    micropost = Micropost.find(params[:micropost_id])
    comment.micropost_id = micropost.id
    if comment.save
      flash[:success] = 'コメントを投稿しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'コメントの投稿に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:danger] = 'コメントを削除しました'
    redirect_back(fallback_location: root_path)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:post)
  end
  
end
