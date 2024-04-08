class ThanksController < ApplicationController

  def create
    work_comment = WorkComment.find(params[:work_comment_id])
    @thank = current_user.thanks.new(work_id: work_comment.work_id, work_comment_id: work_comment.id)
    @thank.save
    render 'replace_btn'
  end

  def destroy
    work_comment = WorkComment.find(params[:work_comment_id])
    @thank = current_user.thanks.find_by(work_id: work_comment.work_id, work_comment_id: work_comment.id)
    @thank.destroy
    render 'replace_btn'
  end
end
