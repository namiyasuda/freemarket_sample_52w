class RenameBirthYearColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :birth_year, :birth_year_id
  end
end
