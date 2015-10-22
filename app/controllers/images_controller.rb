class ImagesController < ApplicationController
  before_action :find_image, except: [:new, :index, :create]
  def index
    uniq_file_names = Image.all.collect { |i| i.pic_file_name }.uniq
    @images = uniq_file_names.collect { |fn| Image.where({pic_file_name: fn}).first }
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

  def edit
  end

  def update
    if @image.update(image_params)
      redirect_to image_path(@image)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @favorite = Favorite.new
    @tag = Tag.new
    @users = User.all
    
  end

  def destroy
    @image.destroy
    redirect_to images_path
  end

  private
  def find_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :caption, :pic, :user_id)
  end
end
