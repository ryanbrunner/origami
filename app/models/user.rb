class User
  include Mongoid::Document
  
  ROLES = %w[admin user]
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  field :name
  field :role
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  def admin?
    self.role == ROLES[0]
  end
  
  def user?
    self.role == ROLES[1]
  end
end
