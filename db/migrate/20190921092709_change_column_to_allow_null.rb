class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :category_id, true
  end
end
