class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.bulid(comment_params, post_id: @post.id)

   if @post.commentcomment.save
      redirect_to post_path(@post)
   else
      # render 'new'
      redirect_to root_path
   end
 end

  def comment_params
    params.require(:comment).permit(:user_id, :text)
  end

end
