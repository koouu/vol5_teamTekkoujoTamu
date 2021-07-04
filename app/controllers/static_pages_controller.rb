class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @microposts = Micropost.all

  end

  def ranking
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @microposts = Micropost.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}

  end

  def help
  end

  def privacy_policy
  end

  def terms_of_service
  end
end
