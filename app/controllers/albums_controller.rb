class AlbumsController < ApplicationController
  before_action :find_user
  before_action :find_album, :except => [:new, :create, :index]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = @user.albums.new(album_params)
    if @album.save
      params[:album][:images].each do |image|
        @album.images.create(pic: image)
      end
      redirect_to user_path(@user)
    else
      render :new
    end
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
end
