class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @most_recent_three_posts = @user.most_recent_three_posts
  end
end
