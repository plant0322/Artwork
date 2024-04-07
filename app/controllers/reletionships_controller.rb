class ReletionshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

  def followwork
    @user = User.find(params[:user_id])
    @works = Work.where(user_id: [current_user, *current_user.following_ids])
  end

  def followart
    @user = User.find(params[:user_id])
    @works = Work.where(user_id: [current_user, *current_user.following_ids], state: "art")
  end
end
