class CommentsController < ApplicationController

  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.new(comment_params)
    if @comment.save
      redirect_to report_path(@report.id)
    else
      @comments = @report.comments.includes(:user)
      render "reports/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

end
