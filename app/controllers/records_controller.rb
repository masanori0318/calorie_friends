class RecordsController < ApplicationController
  def index
  end

  def new
  end

  def create
    # Record モデルのインスタンスを作成
    @record = Record.new(record_params)
    
    # 画像の添付を処理し、Image レコードを保存
    @image = Image.new(image_params)
    
    # ユーザーと食事、カロリーの関連付けを行う
    @record.user = current_user
    @record.meal = @meal
    @record.calories = @calories

    if @record.save && @image.save
      redirect_to @record, notice: 'レコードが正常に作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def home
  end

  private

  def record_params
    params.require(:calorie).permit(:breakfast, :lunch, :dinner, :snack, :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal, :breakfast_img, :lunch_img, :dinner_img, :snack_img)
  end
  
  def image_params
    params.require(:image).permit(:breakfast_img, :lunch_img, :dinner_img, :snack_img)
  end

  def meal_params
    # 必要に応じて食事データの許可されたパラメータを指定してください
  end

  def calorie_params
    # 必要に応じてカロリーデータの許可されたパラメータを指定してください
  end


  def day_record
    if current_user.nil?
      flash[:alert] = "ログインが必要です。"
      redirect_to login_path
      return
    end
  
    # ユーザーを取得する
    @user = current_user # もしくは、必要なユーザーを取得する方法を適用してください

    # 画像を取得する（必要に応じて）
    @image = Image.new # 新しい画像を作成します。必要に応じて画像の初期化を変更してください。

    # 食事を取得する（必要に応じて）
    @meal = Meal.new # 新しい食事を作成します。必要に応じて食事の初期化を変更してください。

    # カロリーを取得する（必要に応じて）
    @calories = Calories.new # 新しいカロリーを作成します。必要に応じてカロリーの初期化を変更してください。
  end


  def not_found
    render status: 404
  end
end