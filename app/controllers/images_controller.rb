class ImagesController < ApplicationController
  before_action :find_image, except: [:new, :index, :create]
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  private
  def find_image
    @image = Image.find(params[:id])
  end
  def image_params
    params.require(:image).permit(:title, :caption, :pic)
  end
end
