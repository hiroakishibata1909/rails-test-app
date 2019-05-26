class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def get_login_user
    # 始めは、どのユーザでもログインしていないからnil
    @login_user = nil
    # cookieにuser_idが保存されていた場合は、そのユーザを呼び出す
    unless cookies[:user_id].nil?
      @login_user = User.find_by(id: cookies[:user_id])
    end
  end
    
end
