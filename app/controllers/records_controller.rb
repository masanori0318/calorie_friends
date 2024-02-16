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
    @record = Record.find(params[:id])
    @breakfast_img_path = rails_blob_path(@record.breakfast_img, disposition: "attachment") if @record.breakfast_img.attached?
    @lunch_img_path = rails_blob_path(@record.lunch_img, disposition: "attachment") if @record.lunch_img.attached?
    @dinner_img_path = rails_blob_path(@record.dinner_img, disposition: "attachment") if @record.dinner_img.attached?
    @snack_img_path = rails_blob_path(@record.snack_img, disposition: "attachment") if @record.snack_img.attached?
    @date = params[:date]
  end

  def show_image
    @record = Record.find(params[:id])
    @image = @record.images.find(params[:image_id])
    send_data @image.download, type: @image.content_type, disposition: 'inline'
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

  private

  def record_params
    params.require(:record).permit(:user_id, :breakfast_img, :lunch_img, :dinner_img, :snack_img, :breakfast, :lunch, :dinner, :snack, :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal)
  end
end