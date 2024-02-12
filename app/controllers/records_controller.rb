class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
    @record.user_id = current_user.id
  end

  def create
    params[:record][:user_id] = current_user.id
    @record = Record.new(record_params)
    @record.date = Date.today  # 今日の日付をセット

    if @record.save
      redirect_to root_path, notice: "Record was successfully created."
    else
      render :new
    end
  end

  def show
    @record = Record.find_by(date: params[:date])
    if @record.present?
      @records = [@record]
    else
      @records = []
    end
    @date = params[:date]
  end


  private

  def record_params
    params.require(:record).permit(:user_id, :breakfast_img, :lunch_img, :dinner_img, :snack_img, :breakfast, :lunch, :dinner, :snack, :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal)
  end
end