class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :user_id, null: false, index: true, foreign_key: true
      t.string  :last_name, null: false
      t.string  :first_name, null: false
      t.string  :last_name_kana, null: false
      t.string  :first_name_kana, null: false
      t.string  :postcode, null: false
      t.integer :prefecture_id, null: false, foreign_key: true
      t.string  :city, null: false
      t.string  :block, null: false
      t.string  :building
      t.string  :phone_number

      t.timestamps
    end
  end
end
