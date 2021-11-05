require "pry"

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.build(comment_params)
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))

    # @comment.user_id = current_user.id


    # binding.pry
  #  if @comment.save
      # redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
      redirect_back(fallback_location: root_path)
      # redirect_to root_path
  #  else
      # render 'new'
      # redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
  #  end
 end

  def comment_params
    params.require(:comment).permit(:text)
  end

end
