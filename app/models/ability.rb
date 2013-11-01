class Ability
  include CanCan::Ability

  def initialize(user)

    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    
     # if a member, they can manage their own posts 
    # (or create new ones)
    if user.role? :member
      can :manage, Wiki
     
    end

    # Moderators can delete any post
    if user.role? :premium_member
     #   can :manage, Wiki, :user_id => user.id
     #   can :update, Collaborateurs, :premium => true
     #   can :update, Privacy, :premium => true
    end



    # Admins can do anything
    if user.role? :admin 
    can :manage, :all
    end

    can :read, :all
    
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
