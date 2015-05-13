class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    can :create_post, User do |resource_user|
      resource_user == user
    end

    if user
      can :create, Journey
      can :create, Post
      can :create, Goal
    end

    can [:update, :destroy], Journey, :user_id => user.id

    can [:update, :destroy], Post, :journey => {:user_id => user.id}
    #  do |post|
    #   user.id == post.journey.user_id
    # end

    can [:update, :destroy], Goal, :journey => {:user_id => user.id}
    #  do |goal|
    #   user.id == goal.journey.user_id
    # end

  end
end



    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
