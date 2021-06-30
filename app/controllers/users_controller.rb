class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reports = Report.where(user_id: @user.id).includes(:user)
  end
  
end
