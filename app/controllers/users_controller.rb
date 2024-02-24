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
    set_minimum_password_length
  end

  def show
    @user = User.find(params[:id])
  end
end