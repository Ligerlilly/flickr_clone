class TagsController < ApplicationController
  before_action :find_tag, except: [:new, :index, :create]

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to image_path(@tag.image), notice: 'success'
    else
      redirect_to images_path
    end
  end

  def destroy
    @tag.destroy
    redirect_to image_path(@tag.image)
  end

  private
  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:user_id, :image_id)
  end
end
