class ItemsController < ApplicationController
  before_filter :sign_in_buyer
  def new
  end

  def create
    if create_order?
      @product = Product.find_by_id(params[:id])
      @item = Item.new(product_id:params[:id], order_id:current_order.id, product_name:@product.title, product_price:@product.price, commentable:true)
      if @item.save
        current_order.items.push @item
        flash[:success] = "add #{@item.product_name}to shop cart successfully!"
        redirect_to current_order
      else
        render new_item_path
      end
    end
  end

  def destroy
      current_order.items.find_by_id(params[:id]).destroy
      @total_cost = current_order.items.sum(:product_price) 
      respond_to do |format|
          format.html {redirect_to current_buyer}
          format.js
      end
  end

  def show
    @item = Item.find_by_id(params[:id])
    @product = Product.find_by_id(@item.product_id)
    @comment = Comment.new(product_id:@product.id, buyer_id:current_buyer.id, item_id:params[:id])
  end
end
