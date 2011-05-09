class MessagesController < ApplicationController
  respond_to :html, :xml, :rss

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  before_filter :find_message, :only => [:show]
  before_filter :find_own_message, :only => [:edit, :destroy, :update]

  # GET /messages
  # GET /messages.xml
  def index
    @messages = (params[:category_id] ?
      Category.find(params[:category_id]).messages :
      @messages = Message.published.includes(:user)).paginate(:page => params[:page], :per_page => 5)

    respond_with(@messages)
  end

  def draft
    @messages = Message.drafts.paginate(:page => params[:page])
    respond_with(@messages) do |format|
      format.html {render :action => 'index'}
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    respond_with(@message)
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new
    respond_with(@message)
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    @message.user = current_user
    @message.tag_list = params[:tags]

    if @message.save
      ping(@message) if APP_CONFIG['ping_enabled']
    end
    respond_with(@message, :flash => true)
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message.tag_list = params[:tags]

    @message.update_attributes(params[:message])
    respond_with(@message, :flash => true)
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message.destroy
    respond_with(@message, :flash => true)
  end

  def tag
    @messages = Message.published.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)
    respond_with(@messages) do |format|
      format.html {render :action => 'index'}
    end
  end

  def tag_cloud
    @tags = Message.published.tag_counts_on(:tags)
  end
     
  private
  def find_message
    @message = Message.find(params[:id])
  end

  def find_own_message
    @message = current_user.messages.find(params[:id])
  end

  def ping(message)
    Pinging.new(
      APP_CONFIG['site_name'], url_for( :host => request.host),
      url_for(:host => request.host, :controller => 'messages', :action => 'show', :id => message.id),
      APP_CONFIG['keywords'].gsub(',', '|')
    ).ping_all
  end
end
