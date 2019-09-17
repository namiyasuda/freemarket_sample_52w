class AddParentIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :parent_id, :integer, null: false, index: true
    add_column :products, :child_id, :integer, null: false, index: true
    add_column :products, :delivery_method_id, :integer, null: false, foreign_key: true
  end
end
