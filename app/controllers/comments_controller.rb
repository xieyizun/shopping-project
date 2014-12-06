class CommentsController < ApplicationController
  before_filter :sign_in_buyer
  
  def new
  end

  def create
    current_buyer.orders.each do |order|
        @item = order.items.find_by_id(params[:comment][:item_id])
        if !@item.nil?
          break
        end
    end
    if !@item.nil?
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
    else
        flash[:warning] = "The item is not existed or doesn't belong to you!"
    end
  end

  def destroy
  end

  def show
  end
end
