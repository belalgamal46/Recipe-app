require 'rails_helper'

RSpec.feature 'PublicRecipes', type: :feature do
  scenario 'User views the list of public recipes' do
    public_recipe1 = FactoryBot.create(:recipe, public: true)
    public_recipe2 = FactoryBot.create(:recipe, public: true)

    visit public_recipes_path

    expect(page).to have_content(public_recipe1.name)
    expect(page).to have_content(public_recipe2.name)
  end
end
