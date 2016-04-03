class CommentsController < ApplicationController
  before_action :find_portrait, only: [:create, :destroy]
  before_action :authenticate_user!

  def create
    @comment = @portrait.comments.new(comments_params)
    @comment.user = current_user
    @comment.save

    redirect_to portrait_path(@portrait)
  end

  def destroy
    @comment = @portrait.comments.find(params[:id])
    @comment.destroy

    redirect_to portrait_path(@portrait)
  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end

  def find_portrait
    @portrait = Portrait.find(params[:portrait_id])
  end
end
