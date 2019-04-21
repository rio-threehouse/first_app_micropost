class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)

    if @micropost.save
      flash[:success] = '投稿しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '投稿に失敗しました ・文字数は255以下ですか？・何も入力しないと投稿されません'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @micropost.destroy
    flash[:danger] = '投稿を削除しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def micropost_params
    params.require(:micropost).permit(:post)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])

    unless @micropost
      redirect_to root_url
    end
  end
end
