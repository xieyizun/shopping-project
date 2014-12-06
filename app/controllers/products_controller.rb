class ProductsController < ApplicationController
  def display
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	@comments = @product.comments.paginate(page: params[:page])  
  	if !sign_in?	
  		store_url
  	else 
      if !create_order?
        store_url
      end
    end
  end

  def issue    
  end
end
