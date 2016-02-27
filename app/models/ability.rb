class Ability
  include CanCan::Ability

  def initialize(user)
    # guest user (not logged in)
    # can only read shared collections
    unless user
      can :read, Collection, share: true
      return
    end

    # user (logged in)
    # can manage own collections, links and pictures
    can :manage, Collection, user_id: user.id
    can :manage, [Link, Picture], collection: { user_id: user.id }

    # and read read shared collections
    can :read, Collection, share: true
  end
end
