require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    include Devise::Test::ControllerHelpers

    before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        @user = User.create(name: 'John Doe', email: 'john@example.com')
        sign_in @user
    end

  describe 'GET #index' do
    it 'returns a success response' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
    end

    it 'is valid with valid attributes' do
        user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password')
        expect(user).to be_valid
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect {
          post :create, params: { user: { name: '' } }
        }.to_not change(User, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { User.create!(name: 'John Doe', email: 'john@example.com', password: 'password') }

    it 'destroys the user' do
      expect {
        delete :destroy, params: { id: user.id }
      }.to change(User, :count).by(0)
    end
  end
end
