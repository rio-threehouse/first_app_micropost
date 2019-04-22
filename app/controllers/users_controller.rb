class UsersController < ApplicationController
  before_action :require_user_logged_in, except: [:new, :create]
  def index
    @users = User.all.order('created_at DESC').page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order('created_at DESC')
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
    #ユーザプロフィール変更
  end

  def update
    #変更の保存
  end

  def destroy
    #ユーザ削除
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
