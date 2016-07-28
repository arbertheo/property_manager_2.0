require 'rails_helper'

feature 'Edit a property', %{
  As a user
  I want to edit my own property
  So that I can make updates if details about my property change
} do
  let(:user) { FactoryGirl.create(:user) }
  let(:property) { FactoryGirl.create(:property, user: user) }

  before do
    login_user(user)
    visit edit_property_path(property)
  end

  scenario 'User edits form correctly' do
    fill_in('Unit', with: '23')
    fill_in('Rent amount', with: '600')
    fill_in('Number of rooms', with: '30')
    fill_in('Rent deposit', with: '700' )
    click_button('Add Property')

    expect(page).to have_content('23')
    expect(page).to have_content('600')
    expect(page).to have_content('30')
    expect(page).to have_content('700')
    expect(page).to have_content('Property saved successfully')
  end

  scenario 'User submits blank form' do
    fill_in('Unit', with: '')
    fill_in('Address', with: '')

    click_button('Add Property')

    expect(page).to have_content('Problems updating property')
  end

  # scenario 'unauthenticated user cannot edit a property' do
  #   'Sign Out'
  #
  #   visit edit_property_path(property)
  #
  #   expect(page).to have_content('You need to sign in or sign up before '\
  #                                'continuing')
  #   expect(current_path).to eq(new_user_session_path)
  # end
end
