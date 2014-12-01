class SessionsController < ApplicationController
	def new
	end

	def create
		buyer = Buyer.find_by_email(params[:session][:email].downcase)
		if buyer && buyer.authenticate(params[:session][:password])
			flash[:success] = "Login successfully!"
			sign_in buyer
			redirect_to buyer
		else
			flash[:error] = "Invaild email and password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
