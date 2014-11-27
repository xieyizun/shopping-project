class ProductsController < ApplicationController
  def display
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def issue
    
  end
end
