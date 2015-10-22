require 'rails_helper'

describe 'add a comment process' do
  before do
    user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image, user_id: user.id)
    login_as(user, :scope => :user)
  end

  it 'can add a comment' do
    visit image_path(@image)
    fill_in 'Content', with: 'Hi'
    click_button 'Create Comment'
    expect(page).to have_content 'Hi'
  end

  it 'gets error if incomplete form' do
    visit image_path(@image)
    click_button 'Create Comment'
    expect(page).to have_content 'You must supply comment content'
  end
end
