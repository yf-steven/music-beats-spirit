class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :artist]
  before_action :report_find, only: [:show, :edit, :update, :destroy, :artist]
  before_action :back_to_index, only: [:edit, :update, :destroy]

  def index
    @reports = Report.includes(:user).order(created_at: "DESC")
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to root_path, notice: "レポートを投稿しました！"
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @report.comments.includes(:user).order(created_at: "DESC")
    @like = Like.new
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to report_path(@report.id), notice: "レポートを更新しました！"
    else
      render :edit
    end    
  end

  def destroy
    if @report.destroy
     redirect_to root_path, notice: "レポートを削除しました！"
    else
      render :edit
    end
  end

  def artist
    @reports = Report.where(artist: @report.artist)
  end

  def search
    @search_params = report_search_params
    @reports = Report.search(@search_params).joins(:user)
  end

  private

  def report_params
    params.require(:report).permit(:title, :artist, :text, :recommend, :violent, :violent_reason, :with_family, :with_family_reason, :preparation, :preparation_reason).merge(user_id: current_user.id)
  end

  def report_find
    @report = Report.find(params[:id])    
  end

  def report_search_params
    params.fetch(:search, {}).permit(:title, :artist, :text, :recommend)
  end

  def back_to_index
    if current_user.id != @report.user.id
      redirect_to root_path
    end
  end

end
