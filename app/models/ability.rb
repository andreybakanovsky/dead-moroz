# frozen_string_literal: true

class Ability
  include CanCan::Ability
  # See the wiki for details: https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

  def initialize(user)
    if user.kid?
      can :read, User, role: 'kid'
      can :update, User
      can %i[read create], Good
      can %i[update destroy], Good, child: user
      can %i[read], Gift, giftable_type: 'Good'
      can %i[create], Gift
      can %i[update destroy], Gift, giftable_type: 'Good', giftable: { child: user }
    end

    if user.elf?
      can :read, User, role: %w[kid elf]
      can :update, User
      can :read, Good
      can %i[read create], Review
      can %i[update destroy], Review, author: user
      can %i[read create], Gift
      can %i[update destroy], Gift, giftable_type: 'Review', giftable: { author: user }
      can :read, Karma
    end

    if user.dead_moroz?
      can :read, User
      can %i[read create], User
      can %i[update destroy], User
      can :read, Good
      can %i[read create], Review
      can %i[update destroy], Review, author: user
      can %i[read create], Gift, giftable_type: 'Review'
      can %i[update destroy], Gift, giftable: { author: user }
      can %i[read create update], Karma
      can :manage, Invitation
    end
  end
end
