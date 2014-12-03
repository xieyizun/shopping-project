class PaymentsController < ApplicationController

  before_filter :sign_in_buyer
  before_filter :cal_totalcost, only: [:new, :create]
  def new
  end

  def create
  	if create_order?
      current_order.total_cost = @total_cost
      current_order.status = "Paid"
      if current_order.update_attribute(:status, "Paid")
  		  delete_order
  		  redirect_to buyer_path
      else
        redirect_to root_url
      end
  	else
  		flash[:error] = "All orders have paid!"
  		redirect_to root_url
  	end
  end

  private
     def cal_totalcost
        @total_cost = 0
        if create_order?
          for item in current_order.items
            @total_cost = @total_cost + item.product_price
          end
        else
          flash[:error] = "All orders have paid!"
          redirect_to current_buyer
        end
    end
end
