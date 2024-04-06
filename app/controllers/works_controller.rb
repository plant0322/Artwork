class WorksController < ApplicationController
    before_action :authenticate_user!

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id
    if @work.save
      flash[:notice] = "投稿しました"
      redirect_to works_path
    else
      render :new
    end
  end

  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
    @new_work_comment = WorkComment.new
    @work_comment = WorkComment.find_by(params[:id])
    unless ViewCount.find_by(user_id: current_user.id, work_id: @work.id)
      current_user.view_counts.create(work_id: @work.id)
    end
  end

  def works_art
    @works = Work.where(state: "art")
  end

  def works_making
    @works = Work.where(state: "making")
  end

  def works_memo
    @works = Work.where(state: "memo")
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to work_path
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    if @work.destroy
      flash[:notice] = "削除しました"
      redirect_to works_path
    else
      render :show
    end
  end

  private

  def work_params
    params.require(:work).permit(:state, :title, :body, :work_image)
  end
end
