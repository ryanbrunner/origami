require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      User.create :name => 'User Name', :password => 'Password', :email => 'e@mail.com'
    end
    
    it "should be successful" do
      get 'show', :id => User.first.id
      response.should be_success
    end
  end

end
