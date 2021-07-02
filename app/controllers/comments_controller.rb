class CommentsController < ApplicationController
  before_action :report_find, only: [:create, :destroy]

  def create
    @comment = @report.comments.new(comment_params)
    if @comment.save
      redirect_to report_path(@report.id)
    else
      @comments = @report.comments.includes(:user)
      render "reports/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to report_path(@report.id)
  end

  private

  def report_find
    @report = Report.find(params[:report_id])
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

end
