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
    # 日付情報を正しくパースしてセットする
    year = params[:record].delete("date(1i)").to_i
    month = params[:record].delete("date(2i)").to_i
    day = params[:record].delete("date(3i)").to_i
    params[:record][:date] = Date.new(year, month, day)
  
    params[:record][:user_id] = current_user.id
    @record = Record.new(record_params)
  
    if @record.save
      redirect_to root_path, notice: "Record was successfully created."
    else
      render :new
    end
  end

  def show
    
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:id].to_i 
    begin
      date = Date.new(year, month, day)
      @record = Record.find_by(date: date)
      if @record.nil?
        # レコードが見つからない場合の処理
        flash[:alert] = "Record for the specified date not found."
        #redirect_to root_path
      else
        # レコードが見つかった場合は、@dateに設定する
        @date = date
      end
    rescue ArgumentError
      # 日付が無効な場合の処理
      flash[:alert] = "Invalid date provided."
      #redirect_to root_path
    end
  end

  

  def destroy
    puts "Destroy action called!"
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path, notice: 'Record was successfully destroyed.'
  end

  def edit
    @record = Record.find(params[:id])
  end  
  
  def update
    @record = Record.find(params[:id])
  
    if @record.update(record_params)
      redirect_to @record, notice: 'Record was successfully updated.'
    else
      render :edit
    end
  end

  def not_found
    respond_to do |format|
      format.html { render plain: 'Not found', status: :not_found }
      format.jpeg { head :not_found }
    end
  end

  def day_record
    @user = current_user
  end

  private

  def set_records
    @records = Record.all
  end

  def record_params
    params.require(:record).permit(:user_id, :breakfast, :lunch, :dinner, :snack, :breakfast_cal, :lunch_cal, :dinner_cal, :snack_cal, :date)
  end
end