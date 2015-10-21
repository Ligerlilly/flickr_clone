require 'rails_helper'

describe 'views a user process' do
  before do
    @user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image, user_id: @user.id)
    @tag = FactoryGirl.create(:tag, user_id: @user.id, image_id: @image.id)
    login_as(@user, :scope => :user)
  end

  it 'can view a user' do
    visit users_path
    click_on @user.username, match: :first
    expect(page).to have_content @user.username
  end
end
