class ShoppingItemsController < ApplicationController
  def index
    @shopping_items = ShoppingItem.all
  end

  def show
    @shopping_item = ShoppingItem.find(params.permit(:id)[:id])
  end

  def update
    params.permit!
    @shopping_item = ShoppingItem.find(params[:id])
    @shopping_item.update_attributes(params[:shopping_item])

    if @shopping_item
      return head 200
    else
      return head 403
    end
  end

  def create
    @shopping_item = ShoppingItem.create(params.permit![:shopping_item]) 
    if @shopping_item
      render 'show.json', status: 201
    else
      return head 403
    end
  end

  def destroy
    ShoppingItem.destroy(params.permit(:id)[:id])
  end
end
