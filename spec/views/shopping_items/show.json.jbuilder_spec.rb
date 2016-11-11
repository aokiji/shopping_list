require 'rails_helper'

RSpec.describe "shopping_items/show.json.jbuilder", type: :view do
  let(:shopping_item) {build(:shopping_item, id: 3)}
  it "renders item as json" do
    assign(:shopping_item, shopping_item)
    render

    shopping_item_json = JSON.parse(rendered)
    expect(shopping_item_json['name']).to eq(shopping_item.name)
    expect(shopping_item_json['id']).to eq(shopping_item.id)
  end
end
