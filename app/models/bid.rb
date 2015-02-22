class Bid < ActiveRecord::Base
	belongs_to :item
  belongs_to :user  
  validate :bid_must_be_higher_than_max
 

  # bidder must bid more than winning amount
  def bid_must_be_higher_than_max    
    if amount <= self.item.max_bid 
      errors.add(:amount, "Must bid higher than current winning bid")
    end
  end

end
