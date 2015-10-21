class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create, :index]
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
end
