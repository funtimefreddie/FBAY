class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.binary :picture
      t.datetime :end_time
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
