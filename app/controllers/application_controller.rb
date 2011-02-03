require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery
  
  before_filter :check_black_list
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :authenticate_user!, :unless => :devise_controller?

  private
  def not_found
    respond_with(nil, :status => 404) do |format|
      format.html {
        flash[:error] = I18n.t(:error404)
        redirect_to(root_path)
      }
    end
  end

  def flash_message(key, *args)                                                                                                             
    flash_type = (args.empty? ? nil : args.first.delete(:type)) || key.to_s.gsub(/\d/, '').to_sym                                           
    flash[flash_type] = I18n.t("#{params[:controller]}.#{params[:action]}.flash.#{key.to_s}", *args)                                        
  end

  def check_black_list
    if request.env["HTTP_USER_AGENT"] =~ /WebCopier|Curl|Wget/
      render_404
      return
    end
  end
end
