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
      @images = @record.images
    else
      @records = []
    end
    @date = params[:date]
  end

  def show_image
    @record = Record.find(params[:id])
    @image = @record.images.find(params[:image_id])
    send_data @image.download, type: @image.content_type, disposition: 'inline'
  end
  

  private

  def set_records
    @records = Record.all
  end

  def not_found
    respond_to do |format|
      format.html { render plain: 'Not found', status: :not_found }
      format.jpeg { head :not_found }
    end
  end

  private

  def record_params
    params.require(:record).permit(:user_id, :breakfast_img, :lunch_img, :dinner_img, :snack_img, :breakfast, :lunch, :dinner, :snack, :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal)
  end
end