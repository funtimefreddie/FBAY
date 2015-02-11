class Item < ActiveRecord::Base
	belongs_to :user
	has_many :bids

  validate :name_must_start_with_f

  def name_must_start_with_f

    if name.starts_with? "F"
    else
      errors.add(:name, "Item must begin with an F please")
    end

  end

end

