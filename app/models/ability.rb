class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      cannot :post, Room
      can :post, Room, :id => user.room_ids
    else
      can :index, Room
      can [:read, :post], Room, :id => user.room_ids
      can :manage, Room, :user_id => user.id
      cannot :destroy, Room
      cannot :post, Room
      can :post, Room, :id => user.room_ids
			can :manage, Bank
			can :manage, Bank, :room_id => user.room_ids
			can :manage, Question, :bank_id => user.bank_ids
    end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
