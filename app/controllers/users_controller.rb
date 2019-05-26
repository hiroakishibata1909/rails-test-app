class UsersController < ApplicationController
  def new
    # モデルオブジェクトを生成する
    # https://railsguides.jp/getting_started.htmlの
    # 5.6 コントローラでデータを保存するで、生成時に@をつけている
    @user = User.new
  end
  
  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    # ユーザーをデータベースに保存する
    @user.save
    
    # ログインしたユーザのidを保存する（idは自動付与される）
    cookies[:user_id] = {
      :value => @user.id,
      :expire => 1.year.from_now
    }
    
    redirect_to '/'
  end
  
  def logout
    cookies.delete(:user_id)
  end
  
  def login
    @user = User.new
  end
  
  def send_login
    @user = User.find_by(
        name: params[:user][:name],
        password: params[:user][:password]
      )
    if @user.nil?
      redirect_to 'users/login'
      return
    end
    
    cookies[:user_id] = {
      :value => @user.id,
      :expire => 1.year.from_now
    }
    
    redirect_to '/'
  end
end
