class LikesController < ApplicationController
  before_action :report_find,  only: [:create, :destroy]

  def create
    @like = Like.new(user_id: current_user.id, report_id: @report.id)
    @like.save
    render :index
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, report_id: @report.id)
    @like.destroy
    render :index
  end

  private

  def report_find
    @report = Report.find(params[:report_id])
  end

end
