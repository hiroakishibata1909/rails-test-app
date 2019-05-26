class HomeController < ApplicationController
  before_action :get_login_user

  def index
    @posts = []
    unless @login_user.nil?
      @posts = Post.where(user_id: @login_user.id)
    end
  end
end
