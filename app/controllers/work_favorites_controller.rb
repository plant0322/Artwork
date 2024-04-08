class WorkFavoritesController < ApplicationController

  def create
    work = Work.find(params[:work_id])
    @favorite = current_user.work_favorites.new(work_id: work.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    work =Work.find(params[:work_id])
    @favorite = current_user.work_favorites.find_by(work_id: work.id)
    @favorite.destroy
    render 'replace_btn'
  end
end
