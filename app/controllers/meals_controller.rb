class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @meal = Meal.new
  end

  def create
    current_user = User.find(session[:user_id])

    # meal_params メソッドで breakfast パラメータを取得し、nil であればデフォルトの値を設定
    params_with_default_breakfast = meal_params.merge(breakfast: meal_params[:breakfast] || 'デフォルトの朝食')

    # デフォルトの朝食を含む params_with_default_breakfast を用いて Meal オブジェクトを作成
    @meal = Meal.new(params_with_default_breakfast)

    if @meal.save
      redirect_to meals_path, notice: 'Meal was successfully created.'
    else
      @meals = Meal.all
      flash.now[:alert] = 'Failed to create meal.'
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:breakfast, :lunch, :dinner, :snack)
  end
end
