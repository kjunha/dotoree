class CommentsController < ApplicationController
  before_action :load_square
  before_action :load_discussion
  before_action :load_comment, except: [:index, :new, :create]
  def index
    @comments = @discussion.comments
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new comment_params
    @comment.creator = current_user.name
    if @discussion.comments << @comment
      redirect_to square_discussion_path(@square, @discussion), notice: "Comment has been made."
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
    @comment.destroy
    redirect_to square_discussion_path(@square, @discussion), alert: "Comment Removed"
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def load_square
    @square = Square.find params[:square_id]
  end
  
  def load_discussion
    @discussion = @square.discussions.find params[:discussion_id]
  end
  
  def load_comment
    @comment = @discussion.comments.find params[:id]
  end
end
