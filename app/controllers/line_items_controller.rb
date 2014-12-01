class LineItemsController < ApplicationController
  def index
  end
  
  def new
  	@lineitem = LineItem.new
    @lineitem_number = current_order.count
  end

  def create
  	@product = Product.find_by_id(params[:product_id])
    @lineitem = LineItem.new(product_id:@product.id, order_id:current_order.id, product_name:@product.title, product_cost:@product.price)
    if @lineitem.save
      flash[:success] = "add to shop cart successfully!"
      current_order.lineitems.new(product_id:@product.id, order_id:current_order.id, product_name:@product.title, product_cost:@product.price)
      redirect_to current_order
    else
      flash[:notice] = "add failure"
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
