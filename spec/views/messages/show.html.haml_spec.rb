require 'spec_helper'

describe "messages/show.html.haml" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :title => "Title",
      :content => "MyText",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(false.to_s)
  end
end
