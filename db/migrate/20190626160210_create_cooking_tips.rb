class CreateCookingTips < ActiveRecord::Migration[5.2]
  def change
    create_table :cooking_tips do |t|
      t.references :ingredient, foreign_key: true
      t.string :tips
      t.integer :safe_mininum_temperature
      t.integer :rest_time
      t.string :rest_time_metric

      t.timestamps
    end
  end
end
