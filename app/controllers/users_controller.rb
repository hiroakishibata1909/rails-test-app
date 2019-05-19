class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.new
    user.name = params[:user][:name]
    user.password = params[:user][:password]
    # ユーザーをデータベースに保存する
    user.save
    
    # ログインしたユーザのidを保存する（idは自動付与される）
    cookies[:user_id] = {
      :value => user.id,
      :expire => 1.year.from_now
    }
    
    redirect_to '/'
  end
end
