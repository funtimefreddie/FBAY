class Bid < ActiveRecord::Base
	belongs_to :item
  belongs_to :user

  # def dollars
  #   return (amount.to_f / 100)
  # end 

  def self.remove_all

    Bid.all.each { |b| b.destroy}

  end

end
