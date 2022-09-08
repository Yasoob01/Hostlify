# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      can :read, Hostel
    elsif user.admin?
      can :manage, :all
    elsif user.hostel_owner?
      can :manage,Hostel do |hostels|
        hostels.user.id == user.id
      end
      can :manage, User do |users|
        users.id == user.id
      end
    elsif user.hostel_seeker?
      can [:read], Hostel
    else

      #cannot :manage, Admin
    end

    # Define abilities for the home here. For example:
    #
    #   return unless home.present?
    #   can :read, :all
    #   return unless home.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the home
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the home can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the home can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
