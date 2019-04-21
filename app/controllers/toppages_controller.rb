class ToppagesController < ApplicationController
  def index
    if logged_in?
      @microposts = current_user.microposts.order('created_at DESC')
      @micropost = current_user.microposts.build
      counts(current_user)
    end
  end
end
