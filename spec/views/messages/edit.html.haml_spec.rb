require 'spec_helper'

describe "messages/edit.html.haml" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :new_record? => false,
      :title => "MyString",
      :content => "MyText",
      :published => false
    ))
  end

  it "renders the edit message form" do
    render

    rendered.should have_selector("form", :action => message_path(@message), :method => "post") do |form|
      form.should have_selector("input#message_title", :name => "message[title]")
      form.should have_selector("textarea#message_content", :name => "message[content]")
      form.should have_selector("input#message_published", :name => "message[published]")
    end
  end
end
