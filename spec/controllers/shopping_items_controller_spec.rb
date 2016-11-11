require 'rails_helper'

RSpec.describe ShoppingItemsController, type: :controller do

  describe "GET #index" do
    let(:shopping_items) {create_list(:shopping_item, 20)}

    it "renders json" do
      get :index, format: 'json'

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:shopping_item) {create(:shopping_item)}
    it "returns http success" do
      get :show, format: 'json', params: {id: shopping_item.id}

      expect(response).to have_http_status(:success)
      expect(assigns(:shopping_item)).to eq(shopping_item)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      shopping_item_name = Faker::Name.name
      expect {post :create, params: {shopping_item: {name: shopping_item_name}}}.to change{ShoppingItem.count}.by(1)
      expect(response).to have_http_status(:success)
      
      shopping_item = ShoppingItem.take
      expect(shopping_item.name).to eq(shopping_item_name)
    end
  end

  describe "POST #destroy" do
    let(:shopping_item) {create(:shopping_item)}
    it "returns http success" do
      id = shopping_item.id
      expect {delete :destroy, params: {id: id}}.to change{ShoppingItem.count}.by(-1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    let(:shopping_item) {create(:shopping_item)}

    it "modifies an existing item" do
      patch :update, params: {"id"=>shopping_item.id, shopping_item: {"name"=> "new_name", "description"=> "new_desc"}}
      
      shopping_item.reload
      expect(shopping_item.name).to eq("new_name")
      expect(shopping_item.description).to eq("new_desc")
    end
  end
end
