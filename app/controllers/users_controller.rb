class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create, :index]
  before_action :get_unique_images

  def index
    @users = User.all
  end

  def show
    tags = Tag.where(:user_id => @user.id)
    @tagged_images = []
    tags.each do |tag|
      @tagged_images.push(tag.image)
    end
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def get_unique_images
    uniq_file_names = @user.images.collect { |i| i.pic_file_name }.uniq
    @images = uniq_file_names.collect { |fn| Image.where({pic_file_name: fn}).first }
  end
end
