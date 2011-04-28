class WelcomeController < ApplicationController
  def index
    render :text => 'Welcome to Origami!'
  end
end