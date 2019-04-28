class UsersController < ApplicationController
  before_action :require_user_logged_in, except: [:new, :create]
  
  def index
    @users = User.all.order('created_at DESC').page(params[:page])
    @followings = current_user.followings.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order('created_at DESC').page(params[:page])
    @micropost = current_user.microposts.build
  end

  def goods
    @user = User.find(params[:id])
    @good_microposts = @user.good_microposts.order('created_at DESC').page(params[:page])
    @micropost = current_user.microposts.build
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.order('created_at DESC').page(params[:page])
    @micropost = current_user.microposts.build
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.order('created_at DESC').page(params[:page])
    @micropost = current_user.microposts.build
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'アカウントを作成しました'
      redirect_to @user
    else
      flash.now[:danger] = 'アカウントの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def profile
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'ユーザ情報を変更しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'ユーザ情報の変更に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    current_user.destroy
    flash[:danger] = 'ユーザを削除しました'
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description, :location, :birthday)
  end
end
