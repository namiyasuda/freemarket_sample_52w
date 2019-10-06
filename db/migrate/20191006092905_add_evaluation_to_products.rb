class AddEvaluationToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :evaluation, :integer
  end
end
