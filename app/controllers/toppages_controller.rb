class ToppagesController < ApplicationController
  def index
    if logged_in?
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
      counts(current_user)
    end
  end
end
