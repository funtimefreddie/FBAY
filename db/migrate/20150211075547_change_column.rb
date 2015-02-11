class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :items, :category, :category_id
  end
end
