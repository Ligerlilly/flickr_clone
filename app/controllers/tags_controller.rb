class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to image_path(@tag.image_id), notice: 'success'
    else
      redirect_to images_path
    end
  end
  private
  def tag_params
    params.require(:tag).permit(:user_id, :image_id)
  end
end
