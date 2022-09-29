class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @most_recent_three_posts = @user.most_recent_three_posts
    end
  end
end
