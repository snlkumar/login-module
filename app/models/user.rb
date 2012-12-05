class User < ActiveRecord::Base

  # DEVISE
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
  #attr_accessible :title, :body

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :recoverable
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :role
  
  # /DEVISE
  
  validates :username, :uniqueness => true, :length => { :within => 4..12 }
    
  # handle roles
  
  def self.user_role; "user"; end
  def self.admin_role; "admin"; end
  def self.guest_role; "guest"; end
  def self.manager_role; "manager"; end

  def self.role_collection
    [['guest', 'guest'],['user','user'],['manager','manager']]
  end
  
  def self.role_collection_with_admin
    [['guest', 'guest'],['user','user'],['manager','manager'],['admin','admin']]
  end

  def role?(role)
    return true if role == 'admin' && self.role == 'admin'
    return true if role == 'manager' && self.role == 'manager'
    return true if role == 'user' && self.role == 'user'
    return true if role == 'guest' && ( self.role.nil? || self.role == 'guest')
  end

  def valid_role?(role)
    ['guest','user', 'manager', 'admin'].include?(role)
  end
 
  def is_admin?
    self.role == 'admin'
  end
 
  def role_access?(role)
    return false if (role.nil? || self.role.nil? || !valid_role?(self.role))
    return true if role == 'guest'
    return true if role == 'admin' && self.role == 'admin'
    return true if role == 'manager' && ['manager', 'admin'].include?(self.role)
    return true if role == 'user' && ['user', 'manager', 'admin'].include?(self.role)
    return false
  end


end
