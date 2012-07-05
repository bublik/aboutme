require 'spec_helper'

describe SessionsController do

# curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/sessions -d "{'user' : { 'email' : 'rebisall@gmail.com', 'password' : ',fhfrelf'}}"
# STATUS 401  {"error":"\u041d\u0435 \u0432\u0435\u0440\u043d\u044b\u0439 \u0435\u043c\u0435\u0439\u043b \u0438\u043b\u0438 \u043f\u0430\u0440\u043e\u043b\u044c."}[~/work/aboutme]$
# STATUS 200 {"session":{"error":"Success","auth_token":"K8RqxbPwkt9QiuYotqEh"}}

  #describe "POST" do
  #  before do
  #    User.create!(
  #        :full_name => "Admin pass(administrator)",
  #        :email => "admin@email.com",
  #        :password => "administrator",
  #        :password_confirmation => "administrator"
  #    )
  #  end
  #
  #
  #  describe "with valid login nad pass" do
  #    it "assigns a newly created message as @message" do
  #
  #      post :create, {'user' => {'email' => 'admin@test.com', 'password' => 'administrator'}}
  #      response.starus.should '200'
  #    end
  #
  #    it "with invalif auth tockens" do
  #      post :create, {'user' => {'email' => 'admin@test.com', 'password' => 'invaild_password'}}
  #      response.starus.should '401'
  #    end
  #  end
  #
  #end
end