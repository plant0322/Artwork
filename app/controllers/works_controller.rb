class WorksController < ApplicationController
  def new
    @work = Work.new
  end

  def create
    @work = Work.new(post_params)
    @work.user_id = current_user.id
    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def index
    @works = Work.all
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:work).permit(:state, :title, :body, :work_image)
  end
end
