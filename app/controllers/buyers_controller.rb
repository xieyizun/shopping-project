class BuyersController < ApplicationController
  before_filter :sign_in_buyer, only: [:edit, :update, :show]
  before_filter :correct_buyer, only: [:edit, :update, :show]
  
  def new
    @buyer = Buyer.new
  end

  def create
    params.permit!
    @buyer = Buyer.new(params[:buyer])

    if @buyer.save
      flash[:success] = "register successfully!"
      sign_in @buyer
      redirect_to root_url
    else
      render new_buyer_path
    end
  end

  def edit
  end

  def update
  end

  def show 
    @orders = current_buyer.orders
  end

  def index
  end

  def destroy
  end
  
  def pay
    
  end

  private
    def correct_buyer
      @buyer = Buyer.find_by_id(params[:id])
      unless !@buyer.nil? and @buyer.id == current_buyer.id
        redirect_to buyer_path(current_buyer)
      end
    end
end
