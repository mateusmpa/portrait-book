class CommentsController < ApplicationController
  def create
    @portrait = Portrait.find(params[:portrait_id])
    @comment = @portrait.comments.create(comments_params)

    redirect_to portrait_path(@portrait)
  end

  def destroy
    @portrait = Portrait.find(params[:portrait_id])
    @comment = @portrait.comments.find(params[:id])

    @comment.destroy

    redirect_to portrait_path(@portrait)
  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end
end
