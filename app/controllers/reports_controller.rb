class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :report_find, only: [:show, :edit, :update, :destroy]

  def index
    @reports = Report.includes(:user).order(created_at: "DESC")
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

  def show
    @comment = Comment.new
    @comments = Comment.includes(:user)
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to report_path(@report.id)
    else
      render :edit
    end    
  end

  def destroy
    if @report.destroy
     redirect_to root_path
    else
      render :edit
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :text, :recommend, :violent, :violent_reason, :with_family, :with_family_reason, :preparation, :preparation_reason).merge(user_id: current_user.id)
  end

  def report_find
    @report = Report.find(params[:id])    
  end
  
end
