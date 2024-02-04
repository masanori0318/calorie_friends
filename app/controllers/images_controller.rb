class ImagesController < ApplicationController
  
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user

    if @image.save
      redirect_to day_record_path, notice: '画像がアップロードされました。'
    else
      render 'records/day_record'
    end
  end

  private

  def image_params
    params.require(:image).permit(:breakfast_img, :lunch_img, :dinner_img, :snack_img)
  end
end