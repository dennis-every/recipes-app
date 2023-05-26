class Ability
  include CanCan::Ability

  def initialize(user)
    # starting rules for all users
    can :read, Recipe do |recipe|
      recipe.public == true
    end

    # additional permissions for logged in users
    return unless user.present?

    can :manage, Recipe do |recipe|
      recipe.user == user
    end
  end
end
