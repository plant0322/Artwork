class ReletionshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_new_work

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    render 'replace_btn'
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    render 'replace_btn'
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
