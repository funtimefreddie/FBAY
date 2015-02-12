class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader 
	belongs_to :user
  belongs_to :category
	has_many :bids

  validate :name_must_start_with_f

  def name_must_start_with_f

    if name.starts_with? "F"
    else
      errors.add(:name, "Item must begin with an F please")
    end

  end

end

