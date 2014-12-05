class Comment < ActiveRecord::Base
	attr_accessible :score, :buyer_id, :product_id, :item_id
	belongs_to :product
	belongs_to :buyer
	belongs_to :item
end
