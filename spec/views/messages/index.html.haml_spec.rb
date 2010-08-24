require 'spec_helper'

describe "messages/index.html.haml" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :title => "Title",
        :content => "MyText",
        :published => false
      ),
      stub_model(Message,
        :title => "Title",
        :content => "MyText",
        :published => false
      )
    ])
  end

  it "renders a list of messages" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
  end
end
