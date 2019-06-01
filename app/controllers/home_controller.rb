class HomeController < ApplicationController
  before_action :get_login_user

  def index
    @posts = []
    unless @login_user.nil?
    
    # ここのfollowsに@を付けるべきかは要確認。
    # 講座では付いていないけど、多分あったほうがいい。
    
      @follows = Follow.where(user_id: @login_user.id)
      posts_user_ids = @follows.map(&:following_user_id).push(@login_user.id)
      @posts = Post.where(user_id: posts_user_ids)
      
      # この二つは両方とも同じ
      # @posts = @posts.order("created_at DESC")
      @posts.order!("created_at DESC")
      
      # for debug
      # puts "@login_user.id : #{@login_user.id}"
    end
  end
end
 