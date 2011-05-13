require 'spec_helper'

describe User do
  describe "validations"
    it "should always have name, email, password" do
      User.new().should_not be_valid
      User.new(:name => 'User Name', :password => 'Password', :email => 'e@mail.com').should be_valid
    end
  
    it "should have no users have same name" do
      User.create(:name => 'User Name', :password => 'Password', :email => 'e@mail.com').should be_valid
      User.new(:name => 'User Name', :password => 'Password', :email => 'f@mail.com').should_not be_valid
    end
  end
  
  describe "#admin?" do
    it "returns true if role is equal to admin" do
      User.new(:name => 'User name', :role => "admin").admin?.should be_true
    end
    
    it "return false if role is not admin" do
      User.new(:name => 'User name', :role => "").admin?.should_not be_true
    end
  end
end
