class JourneysController < ApplicationController

  load_and_authorize_resource #:except => [:create]

  def show
    # @journey = Journey.find(params[:id])
    # authorize! :read, @journey
    @user = User.find(@journey.user_id)
    @posts = Post.all.slice(-5,3)

  end

  def new
    # @journey = Journey.new
    # authorize! :create, @journey
  end

  def create
    binding.pry
    # @journey = Journey.new(journey_params)
    @journey.user_id = current_user.id
    # authorize! :create, @journey

    if @journey.save!
      redirect_to(user_journey_path(current_user, @journey))
    else
      render :new
    end
  end

  def edit
    # @journey = Journey.find(params[:id])
    # authorize! :update, @journey

  end

  def update
    binding.pry
    # @journey = Journey.find(params[:id])
    # authorize! :update, @journey

    @journey.update!(journey_params)
    redirect_to(user_journey_path(current_user, @journey))
  end

  def destroy
    # @journey = Journey.find(params[:id])
    # authorize! :destroy, @journey

    @journey.destroy
    redirect_to('/')
  end

  private
  def journey_params
    params[:journey].permit(:fear, :details)
  end


end
