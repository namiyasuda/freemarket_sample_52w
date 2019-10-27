class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :seller_id, null: false, index: true, foreign_key: true
      t.integer :buyer_id, index: true, foreign_key: true
      t.string  :name, null: false
      t.text    :description, null: false
      t.integer :category_id, null: false, index: true, foreign_key: true
      t.integer :brand_id, index: true, foreign_key: true
      t.integer :state_id, null: false, foreign_key: true
      t.integer :size_id, foreign_key: true
      t.integer :paying_side_id, null: false, foreign_key: true
      t.integer :prefecture_id, null: false, foreign_key: true
      t.integer :delivery_day_id, null: false, foreign_key: true
      t.integer :price, null: false
      t.boolean :listing_stop, null: false, default: false

      t.timestamps
    end
  end
end
