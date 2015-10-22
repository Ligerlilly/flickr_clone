require 'rails_helper'

describe 'add a tag process' do
  before do
    @user = FactoryGirl.create(:user)
    @user_to_tag = FactoryGirl.create(:user, :username => 'Bob', :email => 'b@b.com')
    @image = FactoryGirl.create(:image, user_id: @user.id)
    login_as(@user, :scope => :user)
  end

  it 'can add a tag' do
    visit image_path(@image)
    find('#tag_user_id').find('option:contains("Bob")').select_option
    click_on 'Create Tag'
    expect(page).to have_content @user_to_tag.username
  end
end
