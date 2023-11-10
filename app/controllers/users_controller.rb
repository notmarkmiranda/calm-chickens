class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user&.authenticate(user_params[:password])
      sign_user_in
    elsif @user
      flash[:alert] = "Something went wrong"
      redirect_to sign_up_or_in_path
    else
      create_user
      sign_user_in
    end
  end

  private

  def create_user
    @user = User.create(user_params)
  end

  def sign_user_in
    session[:user_id] = @user.id
    flash[:notice] = "Hey! It worked!"
    redirect_to dashboard_path
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :nickname)
  end
end