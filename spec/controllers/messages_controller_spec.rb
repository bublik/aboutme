require 'spec_helper'

describe MessagesController do

  def mock_message(stubs={})
    @mock_message ||= mock_model(Message, stubs).as_null_object
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  before(:each) do
    mock_user.stub(:messages){mock_message}
    Message.stub(:find).and_return(mock_message)
    @controller.stub(:authenticate_user!){true}
    @controller.stub(:current_user){mock_user}
  end

  describe "GET index" do
    it "assigns all messages as @messages" do
      mock_message.should_receive(:includes).and_return([mock_message])
      Message.stub(:published).and_return(mock_message)
      get :index
      response.should render_template(:index)
      assigns(:messages).should eq([mock_message])
    end
  end

  describe "GET tags" do
    it "assigns all messages as @messages" do
      #mock_message.should_receive(:includes).and_return([mock_message])
      Message.stub(:tagged_with).and_return([mock_message])
      get :tag, :tag => 'tag_name'
      response.should render_template(:index)
      assigns(:messages).should eq([mock_message])
    end
  end


  describe "GET show" do
    it "assigns the requested message as @message" do
      Message.stub(:find).with("37") { mock_message }
      get :show, :id => "37"
      assigns(:message).should be(mock_message)
    end
  end

  describe "GET new" do
    it "assigns a new message as @message" do
      Message.stub(:new) { mock_message }
      get :new
      assigns(:message).should be(mock_message)
    end
  end

  describe "GET edit" do
    it "assigns the requested message as @message" do
      Message.stub(:find).with("37") { mock_message }
      get :edit, :id => "37"
      assigns(:message).should be(mock_message)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created message as @message" do
        Message.stub(:new).with({'these' => 'params'}) { mock_message(:save => true) }
        post :create, :message => {'these' => 'params'}
        flash[:notice].should_not be_blank
        assigns(:message).should be(mock_message)
      end

      it "redirects to the created message" do
        Message.stub(:new) { mock_message(:save => true) }
        post :create, :message => {}
        response.should redirect_to(message_url(mock_message))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved message as @message" do
        Message.stub(:new).with({'these' => 'params'}) { mock_message(:save => false) }
        post :create, :message => {'these' => 'params'}
        flash[:alert].should be_blank
        assigns(:message).should be(mock_message)
      end

      it "re-renders the 'new' template" do
        mock_message.should_receive(:save){ false }
        mock_message.errors[:title] = 'blank title'
        Message.stub(:new) { mock_message(:save => false, :errors => [:title, 'blank']) }
        post :create, :message => {}

        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested message" do
        mock_message.should_receive(:find).with("37") { mock_message }
        mock_message.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :message => {'these' => 'params'}
      end

      it "assigns the requested message as @message" do
        Message.stub(:find) { mock_message(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:message).should be(mock_message)
      end

      it "redirects to the message" do
        Message.stub(:find) { mock_message(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(message_url(mock_message))
      end
    end

    describe "with invalid params" do
      it "assigns the message as @message" do
        Message.stub(:find) { mock_message(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:message).should be(mock_message)
      end

      it "re-renders the 'edit' template" do
        mock_message.errors[:title] = 'title cant be blank'
        mock_message.stub(:find) { mock_message(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested message" do
      mock_message.should_receive(:find).with("37") { mock_message }
      mock_message.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the messages list" do
      Message.stub(:find) { mock_message }
      delete :destroy, :id => "1"
      flash[:notice].should_not be_blank
      response.should redirect_to(mock_message)
    end

    it "should not be sestroyed and rendered flash message" do
      mock_message.errors[:user] = 'cant be  destroyes'
      mock_message.stub(:destroy){false}
      mock_message.should_receive(:find).with("37") { mock_message }
      delete :destroy, :id => "37"
      flash[:alert].should_not be_blank
    end
  end

end
