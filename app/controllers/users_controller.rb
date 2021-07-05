class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]

  def show
    @reports = Report.where(user_id: @user.id).includes(:user).order(created_at: "DESC")
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
  
end
