class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.integer :user_id, null: false, index: true, foreign_key: true
      t.string  :postcode
      t.integer :prefecture_id, foreign_key: true
      t.string  :city
      t.string  :block
      t.string  :building

      t.timestamps
    end
  end
end
