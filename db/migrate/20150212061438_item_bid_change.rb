class ItemBidChange < ActiveRecord::Migration
  def change
    add_column :items, :duration, :integer
    remove_column :items, :end_time    
  end
end
