class ImagesController < ApplicationController
  
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user # ユーザーに関連付ける

    if @image.save
      redirect_to day_record_path, notice: '画像がアップロードされました。'
    else
      render 'records/day_record'
    end
  end

  private

  def image_params
    params.require(:image).permit(:file) # 画像アップロードに関連するパラメータを追加
  end
end

