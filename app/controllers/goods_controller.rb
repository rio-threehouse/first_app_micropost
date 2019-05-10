class GoodsController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.good(micropost)
    flash[:success] = "いいねをしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.ungood(micropost)
    flash[:danger] = "いいねを取り消しました"
    redirect_back(fallback_location: root_path)
  end
end
