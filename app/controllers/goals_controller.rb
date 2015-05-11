class GoalsController < ApplicationController

  def new
    @journey = Journey.find(params[:journey_id])
    @goal = Goal.new
  end

  def create
    binding.pry
  end
end
