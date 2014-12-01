class OrdersController < ApplicationController
  before_filter :sign_in_buyer

  def new
    @order = Order.new
    @order_number = current_buyer.orders.count
  end

  def create
    @order = Order.new(buyer_id:current_buyer.id)
    if @order.save
      create_order @order
      redirect_to @order
    else
      redirect_to root_url
    end
  end

  def index
    @order = current_order
    @items = @order.items
  end

  def edit
     @order = Order.new
     @orders = current_buyer.orders
  end

  def update
    
  end

  def show
    @order = current_order
    @items = @order.items
  end

  def destroy
  end

  private
    def correct_buyer
      @buyer = Buyer.find_by_id(params[:buyer_id])
      unless !@buyer.nil? and @buyer.id == current_buyer.id
        redirect_to buyer_path(current_buyer)
      end
    end
end
