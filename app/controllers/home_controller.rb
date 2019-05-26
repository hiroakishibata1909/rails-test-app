class HomeController < ApplicationController
  def index
    # 始めは、どのユーザでもログインしていないからnil
    @login_user = nil
    # cookieにuser_idが保存されていた場合は、そのユーザを呼び出す
    unless cookies[:user_id].nil?
      @login_user = User.find_by(id: cookies[:user_id])
    end
    
    @posts = nil
    unless @login_user.nil?
      @posts = Post.where(user_id: @login_user.id)
    end
  end
end
