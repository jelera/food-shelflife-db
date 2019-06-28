class CreateCookingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :cooking_methods do |t|
      t.references :ingredient, foreign_key: true
      t.string :cooking_method
      t.float :measure_from
      t.float :measure_to
      t.string :size_metric
      t.integer :cookiing_temperature
      t.float :timing_from
      t.float :timing_to
      t.string :timing_metric
      t.string :timing_per

      t.timestamps
    end
  end
end
