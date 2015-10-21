require 'rails_helper'

describe 'delete an image process' do
  before do
    user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image, user_id: user.id)
    login_as(user, :scope => :user)
  end
  
  it 'can delete an image' do
    visit image_path(@image)
    expect(page).to have_content 'Bogus Image'
    click_link 'Delete'
    expect(page).to_not have_content 'Bogus Image'
  end
end
