class FavoritesController < ApplicationController
  before_action :find_favorite, except: [:new, :create, :index]


  def new
    @favorite = Favorite.new
  end

  def create
    image = Image.find(params[:favorite][:image_id])
    @favorite = image.favorites.new(favorite_params)
    if @favorite.save
      redirect_to image_path(params[:favorite][:image_id])
    else
      redirect_to images_path
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :image_id)
  end
  def find_favorite
    @favorite = Favorite.find(params[:id])
  end
  def find_user
    @user = User.find(params[:user_id])
  end
end
