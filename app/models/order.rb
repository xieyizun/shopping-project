class Order < ActiveRecord::Base
	
	belongs_to :buyer
	has_many :items, dependent: :destroy

	before_save :create_remember_token2
	
	
	private 
		def create_remember_token2
			self.remember_token2 = SecureRandom.urlsafe_base64
		end
end
