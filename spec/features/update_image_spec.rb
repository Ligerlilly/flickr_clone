require 'rails_helper'

describe 'update an image process' do
  before do
    user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image, user_id: user.id)
    login_as(user, :scope => :user)
  end

  it 'can update an image' do
    visit image_path(@image)
    click_link 'Edit'
    fill_in 'Title', with: 'new'
    fill_in 'Caption', with: 'stuff'
    click_button 'Update Image'
    expect(page).to have_content 'new'
  end

  it 'can update an image' do
    visit image_path(@image)
    click_link 'Edit'
    page.attach_file("Pic", 'config/routes.rb')
    click_button 'Update Image'
    expect(page).to have_content 'errors'
  end
end
