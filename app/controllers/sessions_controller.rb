class SessionsController < Devise::SessionsController

  def create
    respond_with do |format|
      format.html { super }
      format.xml {
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
        render :status => 200, :xml => { :session => {
            :auth_token => current_user.authentication_token }}
      }

      format.json {
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
          render :status => 200, :json => { :session => { :auth_token => current_user.authentication_token } }
      }
    end
  end

  def destroy
    respond_to do |format|
      format.html { super }
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
