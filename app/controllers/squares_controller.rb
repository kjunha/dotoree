class SquaresController < ApplicationController
  before_action :authenticate
  before_action :load_square, except: [:index, :new, :create]
  
  def index
    @squares = current_user.squares.all
  end
  
  def new
    @square = Square.new
  end
  
  def create
    @square = Square.new square_params
    @square.user = current_user
    if @square.save
      redirect_to squares_path, notice: "New Square Created!"
    else
      render :new
    end
  end
  
  def show
    @discussion = Discussion.new
  end
  
  def edit
  end
  
  def update
    if @square.update_attributes square_params
      redirect_to @square, notice: "Square Information Updated!"
    else
      render :edit
    end
  end
  
  def destroy
    @square.destroy
    redirect_to squares_path, alert: "Square Deleted."
  end
  
  private
  def square_params
    params.require(:square).permit(:name, :detail)
  end
  
  def load_square
    @square = current_user.squares.find params[:id]
  end
  
end
