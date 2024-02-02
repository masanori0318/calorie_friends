class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to day_record_path, notice: 'Image was successfully created.'
    else
      render 'records/day_record'
    end
  end

  private

  def image_params
    params.require(:image).permit(:file) # 画像アップロードに関連するパラメータを追加
  end
end

