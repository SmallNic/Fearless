class PostsController < ApplicationController

  def new
    @post = Post.new
    @journey = Journey.find(params[:journey_id])
  end


  def create
    journey = Journey.find(params[:journey_id])
    @post = Post.new(post_params)
    @post.journey_id = journey.id
    binding.pry
    if @post.save!
      redirect_to(user_journey_path(current_user, journey))
    else
      redirect :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(user_journey_path(current_user, @post.journey))
  end

  def destroy
    @post = Post.find(params[:id])
    journey = @post.journey
    @post.destroy
    redirect_to(user_journey_path(current_user, journey))
  end



  private
  def post_params
    params[:post].permit(:content)
  end

end
