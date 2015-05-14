class UsersController < ApplicationController

  def index
    @users = User.where.not(id:current_user.id)
    @posts = Post.all.slice(-5,3)
    @journeys = Journey.where(user_id:current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all.slice(-5,3)

  end

  def following
    # binding.pry
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    # binding.pry
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

end
