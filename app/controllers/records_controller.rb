class RecordsController < ApplicationController
  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @records = Record.where(date: @date.beginning_of_month..@date.end_of_month)
    @calendar_records = @records.group_by(&:date)
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
    def show
      date = Date.new(params[:year].to_i, params[:month].to_i, params[:id].to_i)
      @record = Record.find_by(date: date)
      if @record.nil?
        # レコードが見つからない場合の処理
        flash[:alert] = "Record for the specified date not found."
        redirect_to root_path
      end
    end
  end

  def show_image
    @record = Record.find(params[:id])
    @image = @record.breakfast_img if params[:image_type] == 'breakfast'
    @image = @record.lunch_img if params[:image_type] == 'lunch'
    @image = @record.dinner_img if params[:image_type] == 'dinner'
    @image = @record.snack_img if params[:image_type] == 'snack'

    if @image.attached?
      send_data @image.download, type: @image.content_type, disposition: 'inline'
    else
      render plain: 'Image not found', status: :not_found
    end
  end

  def not_found
    respond_to do |format|
      format.html { render plain: 'Not found', status: :not_found }
      format.jpeg { head :not_found }
    end
  end

  private

  def set_records
    @records = Record.all
  end

  def record_params
    params.require(:record).permit(:user_id, :breakfast_img, :lunch_img, :dinner_img, :snack_img, :breakfast, :lunch, :dinner, :snack, :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal)
  end
end