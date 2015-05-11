class GoalsController < ApplicationController

  def new
    @journey = Journey.find(params[:journey_id])
    @goal = Goal.new
  end

  def create
    journey = Journey.find(params[:journey_id])
    @goal = Goal.new(goal_params)
    @goal.journey_id = journey.id
    if @goal.save!
      redirect_to(user_journey_path(current_user, journey))
    else
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update!(goal_params)
    journey = @goal.journey
    redirect_to(user_journey_path(current_user, journey))
  end

  def destroy
    @goal = Goal.find(params[:id])
    journey = @goal.journey
    @goal.destroy
    redirect_to(user_journey_path(current_user, journey))
  end

  private
  def goal_params
    params[:goal].permit(:details, :deadline)
  end

end
