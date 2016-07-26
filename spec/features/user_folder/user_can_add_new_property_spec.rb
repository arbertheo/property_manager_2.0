require "rails_helper"
require "pry"

feature "user can add property" do
  scenario "visitor adds new property successfully" do

    visit new_property_path
    expect(page).to have_content "New property Form"

    fill_in 'Address', with: "13 Harrison"
    fill_in 'Unit_id', with: "3"
    fill_in 'Rent_amount', with: "1000"
    fill_in 'Number_of_rooms', with: "2"
    fill_in 'Pet_friendly', with: "false"
    fill_in 'Occupied_or_not', with: "true"
    fill_in 'Rent_deposit', with: "500"
    fill_in 'Begining_of_lease_date', with: "12/23/2014"
    fill_in 'End_of_lease_date', with: "12/3/2016"



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
    visit new_restaurant_path
    click_button "Add Property"
    expect(page).to have_content "Name can't be blank"

    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "Unit_id can't be blank"
    expect(page).to have_content "Rent_amount can't be blank"
    expect(page).to have_content "Number_of_rooms can't be blank"
    expect(page).to have_content "Pet_friendly can't be blank"
    expect(page).to have_content "Occupied_or_not can't be blank"
  end
end
