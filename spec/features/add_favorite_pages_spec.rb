require 'rails_helper'

describe 'add a favorite process' do
  before do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user, :username => 'Bob', :email => 'b@b.com')
    @image = FactoryGirl.create(:image, user_id: @user.id)
    login_as(@other_user, :scope => :user)
  end

  it 'can add a favorite' do
    visit image_path(@image)
    click_on 'make-favorite'
    expect(page).to have_css '#favorites-listing:contains("Bob")'
  end
end
