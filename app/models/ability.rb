class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    if user.admin?
      can :manage, :all
    else
      can [:read, :update], User, id: user.id
      can [:read], Order, user_id: user.id
      can [:create], Order
      can :create, :read], Comment
      can [:read], Product
    end
  end
end
