class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false, index: true, foreign_key: true
      t.string  :customer_id, null: false

      t.timestamps
    end
  end
end
