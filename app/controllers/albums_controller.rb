class AlbumsController < ApplicationController
  before_action :find_user
  before_action :find_album, :except => [:new, :create, :index]

  def new
    @album = Album.new
  end

  def create
    @album = @user.albums.new(album_params)
    if @album.save
      add_images
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @album.update(album_params)
      add_images
      redirect_to user_album_path(@user, @album)
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to user_path(@user)
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name)
  end

  def add_images
    if params[:album][:images]
      params[:album][:images].each do |image|
        @album.images.create(pic: image, user_id: @user.id)
      end
    end
  end
end
