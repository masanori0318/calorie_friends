class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
 
  def index
    
  end

  def new
    
  end

  def edit
  end
  def show
    @user = User.find(params[:id])
    #@name = current_user.name
    #@users = current_user.users
  end
  
end
