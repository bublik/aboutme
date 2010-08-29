class Category < ActiveRecord::Base
  # has_many :messages, :through => :categories_message
  has_and_belongs_to_many :messages
  validates_presence_of :title, :allow_nil => false

  def to_param
    "#{self.id}-#{self.title.gsub(/[\W]/,'_')}"
  end
end
