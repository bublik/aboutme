class User < ActiveRecord::Base
  has_many :messages

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable#, :encryptable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :email, :password, :password_confirmation, :remember_me
  
  validates_uniqueness_of :email, :case_sensitive => false
  
end
