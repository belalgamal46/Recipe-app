require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'associations' do
    it 'belongs to a recipe' do
      association = described_class.reflect_on_association(:recipe)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a food' do
      association = described_class.reflect_on_association(:food)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end

