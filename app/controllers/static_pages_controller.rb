class StaticPagesController < ApplicationController
	def home
		@products = Product.paginate(page: params[:page])
	end
end
