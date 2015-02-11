class ChangeDataType < ActiveRecord::Migration
  def change
    change_column :items, :category_id, 'integer USING CAST(category_id AS integer)'
  end
end
