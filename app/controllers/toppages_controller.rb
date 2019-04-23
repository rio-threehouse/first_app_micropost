class ToppagesController < ApplicationController
  def index
    if logged_in?
      @microposts = current_user.microposts.order('created_at DESC').page(params[:page])
      @micropost = current_user.microposts.build
      counts
    end
  end

  private
  
  def counts
    @count_microposts = current_user.microposts.count
  end

end
