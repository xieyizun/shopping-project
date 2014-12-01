class Product < ActiveRecord::Base
	attr_accessible :title, :description, :image_url, :price
	has_many :items, dependent: :destroy
end
