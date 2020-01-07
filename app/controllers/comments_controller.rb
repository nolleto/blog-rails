class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params[:comment].permit(:body).merge(user: current_user)
  end
end
