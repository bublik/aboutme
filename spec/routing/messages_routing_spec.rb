require "spec_helper"

describe MessagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/messages" }.should route_to(:controller => "messages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/messages/new" }.should route_to(:controller => "messages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/messages/1" }.should route_to(:controller => "messages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/messages/1/edit" }.should route_to(:controller => "messages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/messages" }.should route_to(:controller => "messages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/messages/1" }.should route_to(:controller => "messages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/messages/1" }.should route_to(:controller => "messages", :action => "destroy", :id => "1")
    end

  end
end
