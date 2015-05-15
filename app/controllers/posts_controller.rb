class PostsController < ApplicationController

  load_and_authorize_resource #:except => [:create]

  def index
    # @posts = Post.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @posts }
    end
  end

  def new
    # @post = Post.new
    @journey = Journey.find(params[:journey_id])
  end

  def create
    # @post = Post.new(post_params)

    journey = Journey.find(params[:journey_id])
    @post.journey_id = journey.id

    if @post.save!
      redirect_to(user_journey_path(current_user, journey))
    else
      redirect :new
    end
  end

  def edit
    # @post = Post.find(params[:id])
    @posts = Post.all.slice(-5,3)
  end

  def update
    # @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(user_journey_path(current_user, @post.journey))
  end

  def destroy
    # @post = Post.find(params[:id])
    journey = @post.journey
    @post.destroy
    redirect_to(user_journey_path(current_user, journey))
  end



  private
  def post_params
    params[:post].permit(:content)
  end

end
