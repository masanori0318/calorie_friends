class UsersController < ApplicationController

  def index
    
  end

  def new
    @user = User.new
  end

  def edit
  end
  def show
    user = User.find(params[:id])
    @name = current_user.name
    @users = current_user.users
  end
  
end
