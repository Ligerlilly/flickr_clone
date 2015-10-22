require 'rails_helper'

describe 'add a comment process' do
  before do
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album, user_id: @user.id)
    @image = FactoryGirl.create(:image, user_id: @user.id)
    @commenting_user = FactoryGirl.create(:user, :username => 'Bob', :email => 'bob@bob.com')
    login_as(@commenting_user, :scope => :user)
  end

  it 'can add a comment to an image' do
    visit user_album_path(@user, @album)
    fill_in 'Content', with: 'Bye'
    click_button 'Create Comment'
    expect(page).to have_content 'Bye'
    expect(page).to have_content @commenting_user.username
  end

  it 'can add a comment to an image' do
    visit image_path(@image)
    fill_in 'Content', with: 'Hi'
    click_button 'Create Comment'
    expect(page).to have_content 'Hi'
    expect(page).to have_content @commenting_user.username
  end

  it 'gets error if incomplete form' do
    visit image_path(@image)
    click_button 'Create Comment'
    expect(page).to have_content 'You must supply comment content'
  end
end
