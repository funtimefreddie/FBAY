class Bid < ActiveRecord::Base
	belongs_to :item
  belongs_to :user  
  validate :bid_must_be_higher_than_max
 

  # def dollars
  #   return (amount.to_f / 100)
  # end 

  # bidder must bid more than winning amount
  def bid_must_be_higher_than_max
    if amount <= item.max_bid 
      errors.add(:amount, "Must bid higher than current winning bid")
    end
  end

  # # bidder cannot bid more than 3 times
  # def cannot_bid_more_than_3_times
  #   if user.bids.where(item_id: item.id).count >= 3
  #     errors.add(:amount, " - sorry you've already bid three times")
  #   end
  # end


end
