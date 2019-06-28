class ChangeColumsNameInIngredients < ActiveRecord::Migration[5.2]
  def change
    rename_column :ingredients, :dop_freezer_metric, :dop_freeze_metric
    rename_column :ingredients, :dop_freezer_tips, :dop_freeze_tips
  end
end
