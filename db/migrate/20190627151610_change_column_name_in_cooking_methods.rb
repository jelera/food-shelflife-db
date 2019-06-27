class ChangeColumnNameInCookingMethods < ActiveRecord::Migration[5.2]
  def change
    rename_column :cooking_methods, :cookiing_temperature, :cooking_temperature
    rename_column :cooking_methods, :cooking_method, :method
  end
end
