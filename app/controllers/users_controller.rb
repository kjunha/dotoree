class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :load_userdata, except: [:new, :create]
  def index
    @user = User.new
  end
  
  def new
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.valid?
    else
      @user = User.new
    end
  end
  
  def create
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.name = user_params[:name]
      @user.email = user_params[:email]
    else
      @user = User.new user_params
    end
    if @user.save
      session[:user_hash] = nil
      login(@user)
      redirect_to  root_path, notice:"Account Created"
    else
      render :new
    end
  end
  
  def show
    @user = current_user
  end
  
  def edit
    
  end
  
  def update
    if @user.update_attributes user_params
      redirect_to @user, notice: "User information updated."
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    logout
    redirect_to root_path, alert: "User information removed"
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def load_userdata
    @user = current_user
  end
end
