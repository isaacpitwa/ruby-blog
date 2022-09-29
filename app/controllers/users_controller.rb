class UsersController < ApplicationController
  def index
    redirect_to new_user_session_path if current_user.nil?
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @most_recent_three_posts = @user.most_recent_three_posts
  end
end
