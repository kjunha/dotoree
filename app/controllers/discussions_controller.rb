class DiscussionsController < ApplicationController
  before_action :load_square
  before_action :load_discussion, except: [:index, :new, :create]
  
  def index
    @discussions = @square.discussions
  end
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    @discussion = Discussion.new discussion_params
    @discussion.creator = current_user.name
    if @square.discussions << @discussion
      redirect_to @square, notice: "Discussion has been made."
    else
      render :new
    end
  end
  
  def show
    @comment = Comment.new
  end
  
  def edit
  end
  
  def update
    if @discussion.update_attributes discussion_params
      redirect_to @square, notice: "Discussion Updated"
    else
      render :edit
    end
  end
  
  def destroy
    @discussion.destroy
    redirect_to @square, alert: "Discussion Removed."
  end
  
  private
  def discussion_params
    params.require(:discussion).permit(:body)
    
  end
  
  def load_square
    @square = Square.find params[:square_id]
  end
  
  def load_discussion
    @discussion = @square.discussions.find params[:id]
  end
end
