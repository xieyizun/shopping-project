class ProductsController < ApplicationController
  def display
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	@comments = @product.comments.paginate(page: params[:page])
  end

  def issue    
  end
end
