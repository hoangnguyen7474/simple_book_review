class Ability
  include CanCan::Ability

<<<<<<< HEAD
  def initialize(user) 
    user ||= User.new # guest user (not logged in)     
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :author
      can :manage, Book, user_id: user.id                   
    elsif user.has_role? :reviewer
      can :read, Book
      can :manage, Comment, user_id: user.id
    end      
=======
  def initialize(user)   
      user ||= User.new # guest user (not logged in)      
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :author
        can :manage, Book, user_id: user.id                   
      elsif user.has_role? :reviewer
        can :read, Book
        can :manage, Comment, user_id: user.id             
      end   
>>>>>>> ec2
  end
end
