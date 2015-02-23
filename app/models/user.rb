class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items
  has_many :bids

  scope :item_bidders, -> (item) {    
    joins('LEFT JOIN bids ON users.id = bids.user_id').    
    where('bids.item_id = ?', item)
  }

  # ROLES = %w[Admin Author Banned]

  def admin?
    self.role == "Admin"
  end

  def author?
    self.role == "Author"
  end

  def banned?
    self.role == "Banned"
  end

  # shows alert to user for a particular item
  def alert item

    alert = ""

    # check if item auction is still open
    if item.open

      # check if current user is winning
      if self == item.leading_bidder
        alert = "You are in the lead"
      else
        alert = "You have been outbid"
      end

    else

      #check if current user has won
      if self == item.leading_bidder
        alert = "You have won the auction"
      else
        alert = "You have missed out"
      end

    end

  end
  
end
