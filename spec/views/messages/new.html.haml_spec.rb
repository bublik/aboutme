require 'spec_helper'

describe "messages/new.html.haml" do
  before(:each) do
    assign(:message, stub_model(Message,
      :new_record? => true,
      :title => "MyString",
      :content => "MyText",
      :published => false
    ))
  end

  it "renders new message form" do
    render

    rendered.should have_selector("form", :action => messages_path, :method => "post") do |form|
      form.should have_selector("input#message_title", :name => "message[title]")
      form.should have_selector("textarea#message_content", :name => "message[content]")
      form.should have_selector("input#message_published", :name => "message[published]")
    end
  end
end
