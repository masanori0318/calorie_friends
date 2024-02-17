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
    
    # 年月日を取得
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    puts params.inspect
    begin
      # 年月日が有効かどうかをチェック
      date = Date.new(year, month, day)

      # 年月日に紐づくレコードを検索
      @record = Record.find_by(date: date)

      if @record.nil?
        flash[:alert] = 'No record found for this date.'
        redirect_to root_path
      else
        # レコードが見つかった場合の処理を記述
        @breakfast_img_path = rails_blob_path(@record.breakfast_img) if @record.breakfast_img.attached?
        @lunch_img_path = rails_blob_path(@record.lunch_img) if @record.lunch_img.attached?
        @dinner_img_path = rails_blob_path(@record.dinner_img) if @record.dinner_img.attached?
        @snack_img_path = rails_blob_path(@record.snack_img) if @record.snack_img.attached?
        @date = @record.date

        p @record # これにより、@recordの中身をターミナルやコンソールに出力します
      end
    rescue ArgumentError
      # 年月日が無効な場合の処理
      flash[:alert] = 'Invalid date'
      #redirect_to root_path
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