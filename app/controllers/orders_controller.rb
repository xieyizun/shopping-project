class OrdersController < ApplicationController
  before_filter :sign_in_buyer

  def new
  end

  def create
    @unpaid_order = Order.new(buyer_id:current_buyer.id)
    @unpaid_order.status = "UnPaid"
    if @unpaid_order.save
      create_order @unpaid_order
      redirect_to @unpaid_order
    else
      redirect_to root_url
    end
  end

  def index
  end

  def edit
  end

  def update
    
  end

  def show
    if !current_order.nil?
      @items = current_order.items
    else
      redirect_to current_buyer
    end
  end

  def destroy
    @order = current_buyer.orders.find_by_id(params[:id])
    @order.destroy
    redirect_to current_buyer
  end

  private
    def correct_buyer
      @buyer = Buyer.find_by_id(params[:buyer_id])
      unless !@buyer.nil? and @buyer.id == current_buyer.id
        redirect_to buyer_path(current_buyer)
      end
    end
end
