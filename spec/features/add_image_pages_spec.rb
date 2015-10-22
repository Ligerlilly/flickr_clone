require 'rails_helper'

describe 'add an image process' do
  before do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  it 'can add an image' do
    visit root_path
    click_link 'New Pic'
    fill_in 'Title', with: 'Hi'
    fill_in 'Caption', with: 'there'
    page.attach_file("Pic", 'spec/fixtures/images/test.jpg')
    click_button 'Create Image'
    expect(page).to have_content 'Hi'
  end

  it 'gets error if incomplete form' do
    visit root_path
    click_link 'New Pic'
    click_button 'Create Image'
    expect(page).to have_content 'errors'
  end
end
