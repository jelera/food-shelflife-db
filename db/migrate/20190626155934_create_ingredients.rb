class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.string :name_subtitle
      t.string :keywords
      t.integer :pantry_min
      t.integer :pantry_max
      t.string :pantry_metric
      t.string :pantry_tips
      t.integer :dop_pantry_min
      t.integer :dop_pantry_max
      t.string :dop_pantry_metric
      t.string :dop_pantry_tips
      t.integer :pantry_after_opening_min
      t.integer :pantry_after_opening_max
      t.string :pantry_after_opening_metric
      t.integer :refrigerate_min
      t.integer :refrigerate_max
      t.string :refrigerate_metric
      t.string :refrigerate_tips
      t.integer :dop_refrigerate_min
      t.integer :dop_refrigerate_max
      t.string :dop_refrigerate_metric
      t.string :dop_refrigerate_tips
      t.integer :refrigerate_after_opening_min
      t.integer :refrigerate_after_opening_max
      t.string :refrigerate_after_opening_metric
      t.integer :refrigerate_after_thawing_max
      t.integer :refrigerate_after_thawing_min
      t.string :refrigerate_after_thawing_metric
      t.integer :freeze_min
      t.integer :freeze_max
      t.string :freeze_metric
      t.string :freeze_tips
      t.integer :dop_freeze_min
      t.integer :dop_freeze_max
      t.string :dop_freezer_metric
      t.string :dop_freezer_tips

      t.timestamps
    end
  end
end
