class Item < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
	belongs_to :user
  belongs_to :category
  has_many :bids
  validates :bid_limit, numericality: { greater_than: 0 }
  validate :name_must_start_with_f

  attr_accessor :end_time

  def name_must_start_with_f

    if name.starts_with? "F"
    else
      errors.add(:name, "Item must begin with an F please")
    end

  end

  # calculates end time based on created at and duration
  def calc_end_time created_at, duration
      return created_at + duration.days 
  end

  # calculated time left to expiry
  def time_left_in_seconds
    @end_time = calc_end_time(created_at, duration)
    return @end_time - Time.now
  end

  # shows time left in terms on days, hours, minutes, seconds
  def time_present

    t = time_left_in_seconds

    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24) 
              #=> [3, 3]
    return "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]

  end

  #show items to exclude user, and include category, if defined
  def self.show_items user_id, category_id

      list = []
       
      if category_id == 0
        list = Item.where.not(user_id: user_id).all
      else
        list = Item.where('user_id != ? AND category_id = ?', user_id, category_id)
      end

      return list 

  end

  def leading_bidder
    if bids.count ==0
      return "No bidder"
    else
      return self.bids.max_by(&:amount).user
    end
  end

  def max_bid
    if bids.count == 0
      return 0
    else
      return self.bids.max_by(&:amount).amount
    end
  end





  

end

