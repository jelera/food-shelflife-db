# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_26_160619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "subcategory_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cooking_methods", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.string "cooking_method"
    t.float "measure_from"
    t.float "measure_to"
    t.string "size_metric"
    t.integer "cookiing_temperature"
    t.float "timing_from"
    t.float "timing_to"
    t.string "timing_metric"
    t.string "timing_per"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_cooking_methods_on_ingredient_id"
  end

  create_table "cooking_tips", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.string "tips"
    t.integer "safe_mininum_temperature"
    t.integer "rest_time"
    t.string "rest_time_metric"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_cooking_tips_on_ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.string "name_subtitle"
    t.string "keywords"
    t.integer "pantry_min"
    t.integer "pantry_max"
    t.string "pantry_metric"
    t.string "pantry_tips"
    t.integer "dop_pantry_min"
    t.integer "dop_pantry_max"
    t.string "dop_pantry_metric"
    t.string "dop_pantry_tips"
    t.integer "pantry_after_opening_min"
    t.integer "pantry_after_opening_max"
    t.string "pantry_after_opening_metric"
    t.integer "refrigerate_min"
    t.integer "refrigerate_max"
    t.string "refrigerate_metric"
    t.string "refrigerate_tips"
    t.integer "dop_refrigerate_min"
    t.integer "dop_refrigerate_max"
    t.string "dop_refrigerate_metric"
    t.string "dop_refrigerate_tips"
    t.integer "refrigerate_after_opening_min"
    t.integer "refrigerate_after_opening_max"
    t.string "refrigerate_after_opening_metric"
    t.integer "refrigerate_after_thawing_max"
    t.integer "refrigerate_after_thawing_min"
    t.string "refrigerate_after_thawing_metric"
    t.integer "freeze_min"
    t.integer "freeze_max"
    t.string "freeze_metric"
    t.string "freeze_tips"
    t.integer "dop_freeze_min"
    t.integer "dop_freeze_max"
    t.string "dop_freezer_metric"
    t.string "dop_freezer_tips"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_ingredients_on_category_id"
  end

  add_foreign_key "cooking_methods", "ingredients"
  add_foreign_key "cooking_tips", "ingredients"
  add_foreign_key "ingredients", "categories"
end
