require 'rails_helper'

describe 'add an album process' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  it 'can add an album' do
    visit user_path(@user)
    click_link 'Create Album'
    fill_in 'Name', :with => 'My Album'
    page.attach_file("Images", 'spec/fixtures/images/test.jpg')
    click_button 'Create Album'
    expect(page).to have_content 'My Album'
  end

  it 'gets error if incomplete form' do
    visit user_path(@user)
    click_link 'Create Album'
    click_button 'Create Album'
    expect(page).to have_content 'errors'
  end
end
