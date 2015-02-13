class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader 
  belongs_to :user
  belongs_to :category
  has_many :bids

  validate :name_must_start_with_f

  attr_accessor :end_time

  def name_must_start_with_f

    if name.starts_with? "F"
    else
      errors.add(:name, "Item must begin with an F please")
    end

  end


  def calc_end_time created_at, duration
      return created_at + duration.days 
  end

  def time_left_in_seconds

    @end_time = calc_end_time(created_at, duration)
    return @end_time - Time.now

  end

  def time_present

    t = time_left_in_seconds

    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24) 
              #=> [3, 3]
    return "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]

  end

end

