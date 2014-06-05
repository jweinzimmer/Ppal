class ItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @item = Item.create(cart: current_cart, product: @product)
    if @item.save
      flash[:notice] = 'Item added'
      redirect_to cart_path
    else
      flash[:error] = 'NO SOUP FOR YOU'
      redirect_to products_path
    end
  end

end
