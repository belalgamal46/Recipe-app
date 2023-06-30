require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe MainRecipesController, type: :controller do
  let!(:user) { User.create(name: "koko", email: "belalgamal00@gmail.com", password: "123456") }
  let!(:recipe) { Recipe.create(name: "salt", preparation_time: "00:05:00", cooking_time: "02:00:00", description: "this is a description", public: true, user: user) }

  before { sign_in user }

  describe "GET #index" do
    it "assigns all recipes to @recipes" do
      get :index
      expect(assigns(:recipes)).to eq([recipe])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested recipe to @recipe" do
      get :show, params: { id: recipe.id }
      expect(assigns(:recipe)).to eq(recipe)
    end

    it "renders the show template" do
      get :show, params: { id: recipe.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new recipe to @recipe" do
      get :new
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_attributes) { { name: "Test Recipe", description: "This is a test recipe." } }

      it "creates a new recipe" do
        expect { post :create, params: { recipe: valid_attributes }
        }.to change(Recipe, :count).by(1)
      end

      it "assigns a newly created recipe as @recipe" do
        post :create, params: { recipe: valid_attributes }
        expect(assigns(:recipe)).to be_a(Recipe)
        expect(assigns(:recipe)).to be_persisted
      end

      it "redirects to the created recipe" do
        post :create, params: { recipe: valid_attributes }
        expect(response).to redirect_to(main_recipe_path(Recipe.last))
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { { name: "", description: "This is an invalid recipe." } }

      it "assigns a newly created but unsaved recipe as @recipe" do
        expect do
          post :create, params: { recipe: invalid_attributes }
        end.to_not change(Recipe, :count)
      end

      it "re-renders the new template" do
        post :create, params: { recipe: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      get :edit, params: { id: recipe.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: "New Recipe Name" } }

      it "updates the requested recipe" do
        put :update, params: { id: recipe.id, recipe: new_attributes }
        recipe.reload
        expect(recipe.name).to eq("New Recipe Name")
      end

      it "redirects to the recipe" do
        put :update, params: { id: recipe.id, recipe: new_attributes }
        expect(response).to redirect_to(main_recipe_path(recipe))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested recipe" do
      expect { delete :destroy, params: { id: recipe.id }
      }.to change(Recipe, :count).by(-1)
    end

    it "redirects to the recipe list" do
      delete :destroy, params: { id: recipe.id }
      expect(response).to redirect_to(main_recipes_path)
    end
  end
end