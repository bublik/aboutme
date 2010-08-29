require 'spec_helper'

describe Message do
  it 'should render cool to_param string' do
    mesg = Message.new(:title => 'my title', :content => 'message body')
    mesg.save
    mesg.to_param.should match(/\d-\w/)
  end
end
