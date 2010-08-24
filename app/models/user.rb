class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :email, :password, :password_confirmation, :remember_me
  validates_presence_of :full_name
  validates_uniqueness_of :full_name, :email, :case_sensitive => false
  
end
