class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @works = @user.works
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
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
