class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :create]

  def create
    # createアクションのコードを追加
  end

  def index
    # indexアクションのコード
  end

  def new
    # newアクションのコード
  end

  def edit
    @user = current_user
    @confirmable_enabled = User.devise_modules.include?(:confirmable)
    set_minimum_password_length
  end

  def show
    @user = User.find(params[:id])
  end

  def set_minimum_password_length
    @minimum_password_length = User.password_length.min
  end
end
