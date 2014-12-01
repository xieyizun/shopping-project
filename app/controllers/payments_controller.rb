class PaymentsController < ApplicationController

  before_filter :sign_in_buyer

  def new
  end
  def create
  	if create_order?
  		current_order.buyer_id = current_buyer.id
  		if current_order.save
  		   delete_order
  		   redirect_to buyer_path
      else
         flash[:notice] = "pay for orders failure!"
         redirect_to new_payment_path
      end
  	else
  		flash[:notice] = "all orders have paid!"
  		redirect_to root_url
  	end
  end
end
