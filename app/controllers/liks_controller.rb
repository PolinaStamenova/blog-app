class LiksController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(text: like_params[:text], user: current_user)
    if @like.save
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
    else
      render :new
    end
  end

  private

  def likes_params
    params.require(:like).permit(:text)
  end
end
