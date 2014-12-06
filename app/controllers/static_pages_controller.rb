class StaticPagesController < ApplicationController
	def home
		@products = Product.paginate(page: params[:page])
		session.delete(:return_to)
	end
end
