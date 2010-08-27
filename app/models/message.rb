class Message < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :content
  scope :published, where(:published => true).order(:created_at)
  scope :drafts, where(:published => false).order(:created_at)
  
  self.per_page = 5

  def to_param
    "#{self.id}-#{self.title.gsub(/[\W]/,'_')}"
  end
end
