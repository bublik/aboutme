class CategoriesMessage < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates_associated :user, :category

end
