class LikesController < ApplicationController
  before_action :report_find,  only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, report_id: @report.id)
    redirect_to report_path(@report.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, report_id: @report.id)
    like.destroy
    redirect_to report_path(@report.id)
    
  end

  private

  def report_find
    @report = Report.find(params[:report_id])
  end

end
