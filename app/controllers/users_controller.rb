class UsersController < ApplicationController
  layout 'application'
  
  before_action :confirm_logged_in
  def index
  end

  def new
  end

  def edit
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  # def confirm_logged_in
  #   if session[:user_id] 
  #     return 
  #   end

  #   flash[:notice] = "Please login."
  #   redirect_to Something_path
  # end
end
