class FavoritesController < ApplicationController
  before_action :find_favorite, except: [:new, :create, :index]

  def create
    image = Image.find(favorite_params[:image_id])
    @favorite = image.favorites.new(favorite_params)
    @favorite.save
    redirect_to image_path(image)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :image_id)
  end
end
