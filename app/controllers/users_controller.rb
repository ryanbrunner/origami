class UsersController < ApplicationController
  load_and_authorize_resource
  layout 'admin'
  
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User updated successfully' }
      else
        format.html { render action: "edit" }
      end
    end
    
  end

end
