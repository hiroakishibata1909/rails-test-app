class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create

    @login_user = nil
    unless cookies[:user_id].nil?
      @login_user = User.find_by(id: cookies[:user_id])
    end
    
    if @login_user.nil?
      redirect_to '/'
      return
    end
      
    @post = Post.new
    @post.content = params[:post][:content]
    @post.user_id = @login_user.id
    @post.save
    
    redirect_to '/'
  end
end
