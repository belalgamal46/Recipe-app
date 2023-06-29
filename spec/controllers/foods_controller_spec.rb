require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
    let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  
    describe 'POST #create' do
      context 'with valid parameters' do
        it 'creates a new food' do
          sign_in user
  
          expect {
            post :create, params: { food: { name: 'Pizza', measurement_unit: 'Slice', price: 9.99 } }
          }.to change(Food, :count).by(1)
  
          expect(response).to redirect_to(foods_path)
          expect(flash[:notice]).to eq('Food successfully created.')
        end
      end
  
      context 'with invalid parameters' do
        it 'does not create a new food' do
          sign_in user
  
          expect {
            post :create, params: { food: { name: '', measurement_unit: 'Slice', price: 9.99 } }
          }.not_to change(Food, :count)
  
          expect(response).to render_template(:new)
        end
      end
    end
  
    describe 'PATCH #update' do
      context 'with valid parameters' do
        it 'creates a new food' do
          sign_in user
  
          expect {
            post :create, params: { food: { name: 'Pizza', measurement_unit: 'Slice', price: 9.99 } }
          }.to change(Food, :count).by(1)
  
          expect(response).to redirect_to(foods_path)
          expect(flash[:notice]).to eq('Food successfully created.')
        end
      end
  
      context 'with invalid parameters' do
        it 'does not create a new food' do
          sign_in user
  
          expect {
            post :create, params: { food: { name: '', measurement_unit: 'Slice', price: 9.99 } }
          }.not_to change(Food, :count)
  
          expect(response).to render_template(:new)
        end
      end
    end
  
    describe 'DELETE #destroy' do
      let!(:food) { Food.create(name: 'Pizza', measurement_unit: 'Slice', price: 9.99, user: user) }
  
      it 'destroys the food' do
        sign_in user
  
        expect {
          delete :destroy, params: { id: food.id }
        }.to change(Food, :count).by(-1)
  
        expect(response).to redirect_to(foods_path)
        expect(flash[:notice]).to eq('Food deleted successfully.')
      end
    end
  end
  