require 'rails_helper'

describe 'delete an album process' do
  before do
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album, user_id: @user.id)
    @image = FactoryGirl.create(:image, album_id: @album.id, user_id: @user.id)
    login_as(@user, :scope => :user)
  end

  it 'can delete an album' do
    visit user_album_path(@user, @album)
    expect(page).to have_content @album.name
    click_link 'Delete'
    expect(page).to_not have_content @album.name
  end
end
