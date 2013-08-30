class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :case_manager
    	can :manage, :all
    elsif user.role? :patient
    	can :manage, :all
    elsif user.role? :friends_family
    	can :manage, :all
    end
    
  end
end