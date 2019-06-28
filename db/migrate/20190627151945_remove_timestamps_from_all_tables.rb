class RemoveTimestampsFromAllTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :created_at, :string
    remove_column :categories, :updated_at, :string
    remove_column :cooking_methods, :created_at, :string
    remove_column :cooking_methods, :updated_at, :string
    remove_column :cooking_tips, :created_at, :string
    remove_column :cooking_tips, :updated_at, :string
    remove_column :ingredients, :created_at, :string
    remove_column :ingredients, :updated_at, :string
  end
end
