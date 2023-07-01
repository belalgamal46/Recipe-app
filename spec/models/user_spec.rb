require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(email: 'john@example.com', password: 'password')
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe '#admin?' do
    it 'returns true if user has role "admin"' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password', role: 'admin')
      expect(user.admin?).to be true
    end

    it 'returns false if user does not have role "admin"' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password', role: 'user')
      expect(user.admin?).to be false
    end
  end

  describe 'associations' do
    it 'has many foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq :has_many
    end

    it 'has many recipe_foods' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq :has_many
    end
  end
end
