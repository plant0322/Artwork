class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_new_work

  def show
    @user = User.find(params[:id])
    @works = @user.works.order(id: :DESC)
    @work = Work.new
  end

  def users_art
    @user = User.find(params[:id])
    @works = @user.works
    @work_state = @user.works.where(state: "art")
  end

  def users_making
    @user = User.find(params[:id])
    @works = @user.works
    @work_state = @user.works.where(state: "making")
  end

  def users_memo
    @user = User.find(params[:id])
    @works = @user.works
    @work_state = @user.works.where(state: "memo")
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_id, :profile)
  end
end
