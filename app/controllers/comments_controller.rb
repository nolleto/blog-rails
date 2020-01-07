class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.user != current_user
      return render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end

    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params[:comment].permit(:body).merge(user: current_user)
  end
end
