require 'rails_helper'

describe 'delete a tag process' do
  before do
    @user = FactoryGirl.create(:user)
    @user_to_tag = FactoryGirl.create(:user, :username => 'Bob', :email => 'b@b.com')
    @image = FactoryGirl.create(:image, user_id: @user.id)
    @tag = FactoryGirl.create(:tag, user_id: @user_to_tag.id, image_id: @image.id)
  end

  it 'can delete a tag if logged in as tagged user' do
    login_as(@user_to_tag, :scope => :user)
    visit image_path(@image)
    expect(page.find('#tagged-users')).to have_content @user_to_tag.username
    find('.delete-tag').click
    expect(page).to_not have_css '#tagged-users'
  end

  it 'cannot delete a tag if logged in as tagged user' do
    login_as(@user, :scope => :user)
    visit image_path(@image)
    expect(page.find('#tagged-users')).to have_content @user_to_tag.username
    expect(page).to_not have_css '.delete-tag'
  end
end
