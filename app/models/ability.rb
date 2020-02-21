# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Movie, public: true
    can :read, Genre, public: true
    can :read, Comment, public: true

    if user.present?
      can :manage, Comment, user_id: user.id
    end
  end
end
