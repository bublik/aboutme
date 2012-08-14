class User < ActiveRecord::Base
  rolify
  has_many :messages

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable #, :encryptable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :email, :password, :password_confirmation, :remember_me, :google_plus_id

  validates_uniqueness_of :email, :case_sensitive => false
  before_create :ensure_authentication_token

  def admin?
    self.has_role?(:admin)
  end

end
