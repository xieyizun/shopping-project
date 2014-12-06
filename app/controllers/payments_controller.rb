class PaymentsController < ApplicationController

  before_filter :sign_in_buyer
  before_filter :order_empty?, :cal_totalcost, only: [:new, :create]

  def new
  end

  def create
  	if create_order?
      if current_order.update_attribute(:status, "Paid")
        flash[:success] = "Order #{current_order.id} is paid successfully!"
  		  delete_order
  		  redirect_to current_buyer
      else
        flash[:warning] = "Pay failure"
        redirect_to current_order
      end
  	else
  		flash[:error] = "All orders have paid!"
  		redirect_to current_buyer
  	end
  end

  private 
    def order_empty?
      if create_order? and current_order.items.count == 0
        flash[:notice] = "Current Order is empty!"
        redirect_to current_order
      end
    end
end
