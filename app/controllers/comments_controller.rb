class CommentsController < ApplicationController
  before_filter :sign_in_buyer
  
  def new
  end

  def create
    @item = Item.find_by_id(params[:comment][:item_id])
    @product = Product.find_by_id(params[:comment][:product_id])
    if @item.commentable == false
        flash[:warning] = "You have already comment on this item!"
        redirect_to @product
    else 
  	   @comment = Comment.new(params[:comment])
  	   if @comment.save
  		    flash[:success] = "Comment successfully!" 
          @item.update(commentable: false)
          redirect_to @product
  	   else
  		    flash[:warning] = "Comment faliure, please try again!"
  	   end
    end   
  end

  def destroy
  end

  def show
  end
end
