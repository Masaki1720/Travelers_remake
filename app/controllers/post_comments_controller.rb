class PostCommentsController < ApplicationController
  def create
    destination = Destination.find(params[:destination_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.destination_id = destination.id
    comment.save
    redirect_to destination_path(destination)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to destination_path(params[:destination_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
