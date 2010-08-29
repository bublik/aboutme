class CategoriesController < ApplicationController

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
    @category = Category.find(params[:id])
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
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with(@category)
  end
end
