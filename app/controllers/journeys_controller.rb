class JourneysController < ApplicationController

  def new
    @journey = Journey.new
  end

  def create
    binding.pry

    @journey = Journey.new(journey_params)
    @journey.user_id = current_user.id
    if @journey.save!
      redirect_to(user_journey_path(current_user, @journey))
    else
      render :new
    end
  end

  def show
    @journey = Journey.find(params[:id])
  end

  private
  def journey_params
    params[:journey].permit(:fear, :details)
  end


end
