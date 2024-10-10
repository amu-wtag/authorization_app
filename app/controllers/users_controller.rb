class UsersController < ApplicationController
  layout 'application'

  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Rails.logger.debug("User Params: #{user_params.inspect}")
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
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

  def confirm
    # print "## token: #{params[:token]}"
    @user = User.find_by(confirmation_token: params[:token])
    if @user && @user.confirmed_at.nil?
      @user.update(confirmed_at: Time.now, confirmation_token: nil)
      redirect_to @user, notice: "Your email has been confirmed successfully!"
    else
      redirect_to root_path, alert: "Invalid confirmation token or email already confirmed."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :role)
  end
end
