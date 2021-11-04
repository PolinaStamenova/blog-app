class CommentsController < ApplicationController

  def new
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(text: comment_params[:text], user: current_user)
    if @comment.save
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
    else
      render :new
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
