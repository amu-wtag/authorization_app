class UsersController < ApplicationController
  layout 'application'
  
  load_and_authorize_resource

  # before_action :confirm_logged_in
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    Rails.logger.debug("User Params: #{user_params.inspect}")
    if @user.save
      flash[:notice] = 'User created successfully.'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User updated successfully.'
      redirect_to root_path
    else
      render :edit
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'User destroyed successfully.'
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :role)
  end

  # def confirm_logged_in
  #   if session[:user_id] 
  #     return 
  #   end

  #   flash[:notice] = "Please login."
  #   redirect_to Something_path
  # end
end
