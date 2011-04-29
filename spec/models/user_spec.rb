require 'spec_helper'

describe User do
  it "should always have name, email, password" do
    User.new().should_not be_valid
    User.new(:name => 'User Name', :password => 'Password', :email => 'e@mail.com').should be_valid
  end
  
  it "should have no users have same name" do
    User.create(:name => 'User Name', :password => 'Password', :email => 'e@mail.com').should be_valid
    User.new(:name => 'User Name', :password => 'Password', :email => 'f@mail.com').should_not be_valid
  end
end
