class ChangeBidAmount < ActiveRecord::Migration
  def change
    change_column :bids, :amount, :decimal, :precision => 8, :scale => 2
  end
end
