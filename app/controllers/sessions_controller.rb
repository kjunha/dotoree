class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      login(@user)
      if session[:return_to] == nil
        redirect_to root_path, notice: "Logged In!"
      else
        redirect_to session[:return_to], notice: "Logged In!"
        session[:return_to] = nil
      end
    else
      redirect_to login_path, alert: "Invalid login credentials"
    end
  end
  
  def destroy
    logout
    redirect_to root_path, notice: "Logged out"
  end
end
