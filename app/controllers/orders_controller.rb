class OrdersController < ApplicationController
  before_filter :sign_in_buyer
  before_filter :totalcost, only: [:show]
  
  def new
  end

  def create
    if create_order?
      flash[:warning] = "There is already existing an unpaid order!"
      redirect_to current_order
    else
      @unpaid_order = Order.new(buyer_id:current_buyer.id)
      @unpaid_order.status = "UnPaid"                      
      if @unpaid_order.save
        create_order @unpaid_order
        redirect_back_or_to current_order
      else
        flash[:warning] = "Order creates failure!"
        redirect_to current_buyer
      end
    end
  end

  def index
    redirect_to current_buyer
  end

  def edit
  end

  def update  
  end

  def show   
  end

  def destroy
    @order = current_buyer.orders.find_by_id(params[:id])
    @order.delete
    respond_to do |format|
      format.html {redirect_to current_buyer}
      format.js
    end
  end
  private 
      def totalcost
        @order = current_buyer.orders.find_by_id(params[:id])
        if !@order.nil?
            @order.total_cost = @order.items.sum(:product_price)
        else
          flash[:warning] = "This order is not existed or doesn't belong to you!"
          redirect_to current_buyer
        end
      end
end
