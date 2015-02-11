class Item < ActiveRecord::Base
	belongs_to :users
	has_many :bids
end
