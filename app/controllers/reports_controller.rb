class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index    
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def report_params
    params.permit(:title, :text, :recommend).merge(user_id: current_user.id)
  end
  
end
