class AddIndexToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :mobile_number, :unique => true
  end
end
