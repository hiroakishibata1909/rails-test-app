class PostsController < ApplicationController
  before_action :get_login_user
  
  def new
    @post = Post.new
  end
  
  def create
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
