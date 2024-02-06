class CaloriesController < ApplicationController
  before_action :set_user
  before_action :set_calorie, only: [:show, :edit, :update, :destroy]

  def index
    @calories = @user.calories.all

    @calorie = Calorie.new
  end

  def show
  end

  def new
    @calorie = Calorie.new
  end

  def create
    @calorie = @user.calories.build(calorie_params)
    @calorie.user_id = @user.id

    if @calorie.save
      redirect_to user_calories_path(@user), notice: 'Calories were successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @calorie.update(calorie_params)
      redirect_to user_calories_path(@user), notice: 'Calories were successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @calorie.destroy
    redirect_to user_calories_path(@user), notice: 'Calories were successfully destroyed.'
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
    return if @user

    # ユーザーが見つからない場合の処理を追加（例: リダイレクトやエラーメッセージ表示）
    redirect_to root_path, alert: 'User not found'
  end

  def set_calorie
    @calorie = @user.calories.find(params[:id])
  end

  def calorie_params
    params.require(:calorie).permit(:breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal)
  end
end
