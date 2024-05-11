# app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if current_user.role == 'admin'
      can :manage, Loan
      admin_dashboard_path
    else
      # Define abilities for non-admin users
      can :read, :all # for example, non-admin users can read all resources
    end
  end
end
