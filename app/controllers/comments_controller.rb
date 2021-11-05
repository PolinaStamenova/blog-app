class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @comment = Comment.new(comment_params, user: current_user.id, post: @post.id)
    # @post = current_user.posts.build(comment_params)
    if @comment.save
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
      # redirect_to user_post_path(user_id: @post.user_id, id: @post.id)

    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
