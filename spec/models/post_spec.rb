require 'spec_helper'

describe Post do
  it "should always have a title" do
    Post.new().should_not be_valid
  end
  
end
