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
      can %i[read translate], Good
      can %i[read create], Review
      can %i[update destroy], Review, author: user
      can %i[read create translate], Gift
      can %i[update destroy], Gift, giftable_type: 'Review', giftable: { author: user }
      can %i[read approved_gifts], Karma
      can :search_smth, :search
    end

    if user.dead_moroz?
      can :read, User
      can %i[read create average_grade good_years suggested_gifts reviews requested_gifts], User
      can %i[update destroy], User
      can %i[read translate], Good
      can %i[read create destroy undiscard], Review
      can %i[update], Review, author: user
      can %i[read create translate update_dead_choice], Gift
      can %i[update destroy], Gift, giftable_type: 'Review', giftable: { author: user }
      can %i[read create update], Karma
      can :manage, Invitation
      can :search_smth, :search
    end
  end
end
