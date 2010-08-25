class Message < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :content
  scope :published, where(:published => true)
  
  @per_page  = 10

  def to_param
    "#{self.id}-#{self.title.gsub(/[\W]/,'_')}"
  end
end
