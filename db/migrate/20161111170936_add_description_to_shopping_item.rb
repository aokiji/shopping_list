class AddDescriptionToShoppingItem < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_items, :description, :text
  end
end
