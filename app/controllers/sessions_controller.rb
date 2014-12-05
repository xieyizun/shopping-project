class SessionsController < ApplicationController
	def new
	end

	def create
		buyer = Buyer.find_by_email(params[:session][:email].downcase)
		if buyer && buyer.authenticate(params[:session][:password])
			flash[:success] = "Login successfully!"
			sign_in buyer
			@unpaid_order = current_buyer.orders.find_by_status("UnPaid")
			if !@unpaid_order.nil?	
				create_order @unpaid_order
			end
			redirect_to buyer
		else
			flash[:error] = "Invaild email and password combination"
			render new_session_path
		end
	end

	def destroy
		delete_order
		sign_out
		redirect_to root_url
	end
end
