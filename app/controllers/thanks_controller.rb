class ThanksController < ApplicationController

  def create
    @work_comment = WorkComment.find(params[:work_comment_id])
    thank = current_user.thanks.new(work_comment_id: @work_comment.id)
    thank.save
    redirect_to request.referer
  end

  def destroy
    @work_comment = WorkComment.find(params[:work_comment_id])
    thank = current_user.thanks.find_by(work_comment_id: @work_comment.id)
    thank.destroy
    redirect_to request.referer
  end
end
