class DiscussionsController < ApplicationController
  before_action :load_square
  
  def index
    @discussions = @square.discussions
  end
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    @discussion = Discussion.new discussion_params
    
    if @square.discussions << @discussion
      redirect_to @square, notice: "Discussion has been made."
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def discussion_params
    params.require(:discussion).permit(:body, :date)
    
  end
  
  def load_square
    @square = Square.find params[:square_id]
  end
end
