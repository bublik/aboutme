class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, :except => [:show, :index]

  def flash_message(key, *args)                                                                                                             
    flash_type = (args.empty? ? nil : args.first.delete(:type)) || key.to_s.gsub(/\d/, '').to_sym                                           
    flash[flash_type] = I18n.t("#{params[:controller]}.#{params[:action]}.flash.#{key.to_s}", *args)                                        
  end
end
