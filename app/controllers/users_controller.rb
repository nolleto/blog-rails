class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by!(username: params[:username])
    @posts = @user.posts.order('created_at DESC')
    @comments_count = User.joins(posts: :comments)
                          .where(id: @user.id)
                          .count(:comments) 
  end
end
