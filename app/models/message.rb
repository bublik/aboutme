class Message < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :content
  scope :published, where(:published => true).order('created_at DESC')
  scope :drafts, where(:published => false).order('created_at DESC')

  acts_as_taggable
  scope :by_join_date, order('created_at DESC')

  @per_page = 5

  def to_param
    "#{self.id}-#{self.title.gsub(/[\W]/,'_')}"
  end
end
