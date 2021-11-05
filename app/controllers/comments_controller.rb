class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @user = @current_user
    # @user_id = current_user.id
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id


   if @comment.save
      redirect_to user_post_path(user_id: @post.user.id, post_id: @post.id)
      # redirect_to root_path
   else
      # render 'new'
      redirect_to root_path
   end
 end

  def comment_params
    params.require(:comment).permit(:text)
  end

end
