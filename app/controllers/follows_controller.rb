class FollowsController < ApplicationController
  def create
    @follow = Follow.new
    @follow.user_id = params[:user_id]
    @follow.following_user_id = params[:following_user_id]
    @follow.save
    redirect_to '/users'
  end
  
  def destroy
    @follow = Follow.find_by(params[:id])
    @follow.destroy
    redirect_to '/users'
  end
end
