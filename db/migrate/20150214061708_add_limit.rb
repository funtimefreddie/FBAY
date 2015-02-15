class AddLimit < ActiveRecord::Migration
  def change
    add_column :items, :bid_limit, :integer
  end
end
