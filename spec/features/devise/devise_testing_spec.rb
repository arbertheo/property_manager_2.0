require 'rails_helper'

feature 'User create an account', %{
  As a user
  I want to create an account
  So that I can create properties and make notes
} do
  scenario 'visits sign up page' do
    visit root_path
    expect(page).to have_content 'Sign up'
  end

  scenario 'creates an account' do
    visit new_user_registration_path

    click_link 'Sign up'
    fill_in 'First name', with: 'Jon'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'arber@gmail.com'
    fill_in 'Password', with: 'abc12345'
    fill_in 'Password confirmation', with: 'abc12345'
    click_button 'Sign up'

    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end
end
