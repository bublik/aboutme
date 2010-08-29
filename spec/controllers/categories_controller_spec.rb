require 'spec_helper'

describe CategoriesController do
  def mock_message(stubs={})
    @mock_message ||= mock_model(Message, stubs).as_null_object
  end

  def mock_category(stubs={})
    @mock_category ||= mock_model(Category, stubs).as_null_object
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  before(:each) do
    mock_user.stub(:messages){mock_message}
    Category.stub(:find).and_return(mock_message)
    @controller.stub(:authenticate_user!){true}
    @controller.stub(:current_user){mock_user}
  end
  
  describe "GET index" do
    it "should redirect to root path" do
      get :index
      response.should redirect_to(root_path)
    end
  end

  describe "GET show" do
    it "should redirect to cate ory messages" do
      get :show, :id => "37"
      response.should redirect_to(category_messages_path('37'))
    end
  end

  describe "GET new" do
    it "assigns a new category as @category" do
      Category.stub(:new) { mock_category }
      get :new
      assigns(:category).should be(mock_category)
    end
  end

  describe "GET edit" do
    it "assigns the requested category as @category" do
      Category.stub(:find).with("37") { mock_category }
      get :edit, :id => "37"
      assigns(:category).should be(mock_category)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created category as @category" do
        Category.stub(:new).with({'these' => 'params'}) { mock_category(:save => true) }
        post :create, :category => {'these' => 'params'}
        assigns(:category).should be(mock_category)
      end

      it "redirects to the created category" do
        Category.stub(:new) { mock_category(:save => true) }
        post :create, :category => {}
        response.should redirect_to(category_url(mock_category))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        Category.stub(:new).with({'these' => 'params'}) { mock_category(:save => false) }
        post :create, :category => {'these' => 'params'}
        assigns(:category).should be(mock_category)
      end

      it "re-renders the 'new' template" do
        mock_category.errors[:title] = 'cant be blank'
        Category.stub(:new) { mock_category(:save => false) }
        post :create, :category => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested category" do
        Category.should_receive(:find).with("37") { mock_category }
        mock_category.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :category => {'these' => 'params'}
      end

      it "assigns the requested category as @category" do
        Category.stub(:find) { mock_category(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:category).should be(mock_category)
      end

      it "redirects to the category" do
        Category.stub(:find) { mock_category(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(category_url(mock_category))
      end
    end

    describe "with invalid params" do
      it "assigns the category as @category" do
        Category.stub(:find) { mock_category(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:category).should be(mock_category)
      end

      it "re-renders the 'edit' template" do
        Category.stub(:find) { mock_category(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested category" do
      Category.should_receive(:find).with("37") { mock_category }
      mock_category.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the categories list" do
      Category.stub(:find) { mock_category }
      delete :destroy, :id => "1"
      response.should redirect_to(categories_url)
    end
  end

end
