class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to sign_up_or_in_path
  end
end