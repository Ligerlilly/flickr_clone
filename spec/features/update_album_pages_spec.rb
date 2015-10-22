require 'rails_helper'

describe 'update an album process' do
  before do
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album, user_id: @user.id)
    image = FactoryGirl.create(:image, user_id: @user.id)
    login_as(@user, :scope => :user)
  end

  it 'can update an album' do
    visit user_album_path(@user, @album)
    click_link 'Edit'
    fill_in 'Name', :with => 'SmartWater'
    click_button 'Update Album'
    expect(page).to have_content 'SmartWater'
  end

  it 'gets errors if no name' do
    visit user_album_path(@user, @album)
    click_link 'Edit'
    fill_in 'Name', :with => ''
    click_button 'Update Album'
    expect(page).to have_content 'errors'
  end
end
