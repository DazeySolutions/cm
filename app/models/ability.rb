class Ability
  include CanCan::Ability

  def initialize(user)
    guest = User.new
    guest.role = Role.new
    guest.role.name = "Viewer"
    user ||= guest
    if user.admin?
      can :manage, :all
    elsif user.editor?
      can :manage, Event
      can :manage, Sermon
      can :read, :all
    else
      can :read, Event
      can :read, Sermon
    end
  end
end
