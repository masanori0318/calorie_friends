class RecordsController < ApplicationController
  def new
    @record = Record.new
    # 現在のユーザーの ID を取得して user_id パラメーターに設定
    @record.user_id = current_user.id
  end

  def create
    # 現在のユーザーの ID を取得して user_id パラメーターに設定
    params[:calorie][:user_id] = current_user.id

    @record = Record.new(record_params)
    if @record.save
      # 保存成功時の処理
      redirect_to root_path, notice: "Record was successfully created."
    else
      # 保存失敗時の処理
      render :new
    end
  end

  private

  def record_params
    params.require(:calorie).permit(:user_id, :breakfast_img, :lunch_img, :dinner_img, :snack_img, :breakfast, :lunch, :dinner, :snack, :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal)
  end
end