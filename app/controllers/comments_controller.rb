class CommentsController < ApplicationController
  before_action :report_find, only: [:create, :destroy]

  def create
    @comment = @report.comments.build(comment_params)
    if @comment.save
      render :index
    else
      render :error
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end

  private

  def report_find
    @report = Report.find(params[:report_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :report_id).merge(user_id: current_user.id)
  end

end
