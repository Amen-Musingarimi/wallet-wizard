require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456', password_confirmation: '123456',
                        confirmation_token: nil, confirmed_at: Time.now)
  end
  describe 'sign in page' do
    scenario 'should have a sign in page' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end
    scenario 'should have a sign in button' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end
    scenario 'should have a sign up link' do
      visit new_user_session_path
      expect(page).to have_link('Sign up')
    end
    scenario 'should have a forgot password link' do
      visit new_user_session_path
      expect(page).to have_link('Forgot your password?')
    end
    scenario 'when user signs in with valid credential it will redirect to group page' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'LOG IN'
      expect(page).to have_content('Signed in successfully')
    end
    scenario 'when user signs in with invalid credential it will redirect to sign in page' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: ''
      click_button 'LOG IN'
      expect(page).to have_content('Log in')
    end
  end
  describe 'sign up page' do
    scenario 'should have a sign up page' do
      visit new_user_registration_path
      expect(page).to have_content('Log in')
    end
    scenario 'should have a sign up button' do
      visit new_user_registration_path
      expect(page).to have_button('Sign up')
    end
  end
  describe 'forgot password page' do
    it 'should have a forgot password page' do
      visit new_user_password_path
      expect(page).to have_content('Log in')
    end
    it 'should have a send me reset password instructions button' do
      visit new_user_password_path
      expect(page).to have_button('Send me reset password instructions')
    end
  end
end
