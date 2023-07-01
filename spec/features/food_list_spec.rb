require 'rails_helper'

RSpec.feature 'Food List', type: :feature do
  let!(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }

  scenario 'User views the list of foods' do
    # Sign in the user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    # Create a food
    Food.create(name: 'Pizza', measurement_unit: 'Slice', price: 9.99, user: user)

    # Visit the food list page
    visit foods_path

    # Assert that the food is displayed in the table
    expect(page).to have_content('Pizza')
  end
end
