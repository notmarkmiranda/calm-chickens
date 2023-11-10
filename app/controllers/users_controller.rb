class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Hey! It worked!"
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :nickname)
  end
end