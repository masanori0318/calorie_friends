class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]

  def index
  end

  def new
  end

  def edit
    self.resource = resource_class.new
    set_minimum_password_length
    resource.reset_password_token = params[:reset_password_token]
  end

  def show
    @user = User.find(params[:id])
    # @name = current_user.name
    # @users = current_user.users
  end
end
