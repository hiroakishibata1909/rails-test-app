class HomeController < ApplicationController
  def index
    @login_user = nil
    unless cookies[:user_id].nil?
      @login_user = User.find_by(id: cookies[:user_id])
    end
    @posts = Post.where(user_id: @login_user.id)
  end
end
