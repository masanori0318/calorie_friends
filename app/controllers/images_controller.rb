class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user

    if @image.save
      # 保存が成功した場合の処理
      redirect_to root_path, notice: '画像が正常にアップロードされました。'
    else
      # 保存が失敗した場合の処理
      render :new
    end
  end

  private

  def image_params
    params.permit(:breakfast_img, :lunch_img, :dinner_img, :snack_img)
  end
end
