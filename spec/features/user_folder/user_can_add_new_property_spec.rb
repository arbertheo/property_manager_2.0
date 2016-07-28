require "rails_helper"
require "pry"

feature "user can add property" do

  let(:user) { FactoryGirl.create(:user) }
  let(:property) { FactoryGirl.build(:property) }

  before do
    login_user(user)
    visit new_property_path
  end

  scenario "visitor adds new property successfully" do


    visit new_property_path
    expect(page).to have_content "New property Form"

    fill_in 'Address', with: "13 Harrison"
    fill_in 'Unit', with: "3"
    fill_in 'Rent amount', with: "1000"
    fill_in 'Number of rooms', with: "2"
    fill_in 'Pet friendly', with: "false"
    fill_in 'Occupied or not', with: "true"
    fill_in 'Rent deposit', with: "500"
    fill_in 'Begining of lease date', with: "12/23/2014"
    fill_in 'End of lease date', with: "12/3/2016"



    click_button "Add Property"

    expect(page).to have_content "13 Harrison"
    expect(page).to have_content "3"
    expect(page).to have_content "1000"
    expect(page).to have_content "2"
    expect(page).to have_content "false"
    expect(page).to have_content "true"
    expect(page).to have_content "500"
    expect(page).to have_content "12/23/2014"
    expect(page).to have_content "12/3/2016"


  end

  scenario "visitor does not provide proper information for a property" do
    visit new_property_path
    click_button "Add Property"

    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "Unit  can't be blank"
    expect(page).to have_content "Rent amount can't be blank"
    expect(page).to have_content "Number of rooms can't be blank"
    expect(page).to have_content "Occupied or not"
    expect(page).to have_content "Rent deposit"
  end
end
