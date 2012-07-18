class TokenAuthenticationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    respond_to do |format|
      format.html {
        if params[:new_token]
          current_user.reset_authentication_token!
        end
        redirect_to :edit_user_registration
      }
      format.xml {
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
        render :status => 200, :xml => {:session => {:error => "Success", :auth_token => current_user.authentication_token}}
      }

      format.json {
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
        render :status => 200, :json => {:session => {:error => "Success", :auth_token => current_user.authentication_token}}
      }
    end
  end

  def destroy
    current_user.update_attribute(:authentication_token, nil)

    respond_to do |format|
      format.html { redirect_to :edit_user_registration }
      format.xml {
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
        current_user.authentication_token = nil
        render :xml => {}.to_xml, :status => :ok
      }

      format.json {
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
        current_user.authentication_token = nil
        render :json => {}.to_json, :status => :ok
      }
    end
  end
end