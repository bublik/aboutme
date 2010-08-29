require 'spec_helper'

describe MessagesHelper do

  it 'should return tags list' do
    message = Message.new(:title => 'message')
    message.tag_list = 'tag1, tag2'
    helper.message_tags(message).should have_selector('a', :href => '/messages/tag/tag1', :content => 'tag1')
    helper.message_tags(message).should have_selector('a', :href => '/messages/tag/tag2', :content => 'tag2')
  end
end
