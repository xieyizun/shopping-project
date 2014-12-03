class SessionsController < ApplicationController
	def new
	end

	def create
		buyer = Buyer.find_by_email(params[:session][:email].downcase)
		if buyer && buyer.authenticate(params[:session][:password])
			flash[:success] = "Login successfully!"
			sign_in buyer
			if !current_buyer.unpaidorder.nil?
				create_order current_buyer.unpaidorder
			end
			redirect_to buyer
		else
			flash[:error] = "Invaild email and password combination"
			render 'new'
		end
	end

	def destroy
		if create_order?
			current_buyer.unpaidorder = current_order
			current_buyer.save
		end
		sign_out
		delete_order
		redirect_to root_url
	end
end
