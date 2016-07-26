scenario 'spcifying valid adn required information'
  visit root_path
  click_link 'Sign up'
  fill_in
  fill_in
  fill_in
  fill_in
  fill_in
  fill_in
  click_button 'Sign UP'

  expect(page).to have_content("Property manager 2.0")
  expect(page).to have_content("")

end
