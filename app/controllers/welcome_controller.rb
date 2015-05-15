class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @journeys = Journey.where(user_id:current_user.id)
    @posts = Post.all.slice(-5,3)
  end

end
