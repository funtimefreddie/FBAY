class Item < ActiveRecord::Base

  mount_uploader :picture, PictureUploader

	belongs_to :user
  belongs_to :category
  has_many :bids

  validates :bid_limit, numericality: { greater_than: 0 }
  validate :name_must_start_with_f

  scope :not_user, -> (user) {where('user_id != ?', user.id) }
  scope :category, -> (category) {where(:category => category)}
 

  attr_accessor :end_time, :open

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


    time_left = [0, @end_time - Time.now].max

    if time_left == 0
      @open = false
    else
      @open = true
    end

    return time_left
  end

  # shows time left in terms on days, hours, minutes, seconds
  def time_present

    t = time_left_in_seconds

    if @open   

      mm, ss = t.divmod(60)            #=> [4515, 21]
      hh, mm = mm.divmod(60)           #=> [75, 15]
      dd, hh = hh.divmod(24) 
                #=> [3, 3]
      return "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]

    else

      return @open

    end

  end 

  # returns user with highest bid
  def leading_bidder
    if bids.count ==0
      return "No bidder"
    else
      return self.bids.max_by(&:amount).user
    end
  end

  # returns highest bid amount
  def max_bid
    if bids.count == 0
      return 0
    else
      return self.bids.max_by(&:amount).amount
    end
  end

  # returns maximum bid from a specific user
  def max_user_bid user
    if bids.where(user_id: user.id).count == 0
      return 0
    else
      return self.bids.where(user_id: user.id).max_by(&:amount).amount
    end
  end





  

end

