class User < ApplicationRecord
  attr_writer :login
  attr_accessor :role

  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books 
  has_many :comments, dependent: :destroy  

  
  after_create :assign_user_role
  validate :validate_username 

  def login
    @login || self.username || self.email
  end  
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end 

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  private

  def assign_user_role
    self.add_role(self.role.parameterize.underscore.to_sym)
  end      
end
