class LineItem < ActiveRecord::Base
	attr_accessible :product_id, :order_id, :product_name, :product_cost
	validates :product_id, presence: true	
	belongs_to :product
	belongs_to :order
end
