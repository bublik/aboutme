class CategoriesController < ApplicationController

  before_filter :init_post, :only => [:destroy, :edit, :update]

  def index
    redirect_to(root_path)
  end

  def show
    redirect_to(category_messages_path(params[:id]))
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new
    respond_with(@category)
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    if @category.save
      respond_with(@category, :flash => true)
    else
      redirect_to(category_messages_path(@category))
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
  def init_post
    @category = Category.find(params[:id])
  end
end
