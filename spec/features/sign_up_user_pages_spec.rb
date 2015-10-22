require 'rails_helper'

describe 'the user signup process' do
  it 'can signup a user' do
    visit new_user_registration_path
    fill_in 'Username', :with => 'Steve'
    fill_in 'Email', :with => 's@s.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    find('input[type="submit"]').click
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
