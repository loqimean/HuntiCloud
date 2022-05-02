# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_02_065635) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "envelope_formulas", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "daily_expences", precision: 10, scale: 2, null: false
    t.decimal "savings", precision: 10, scale: 2, null: false
    t.decimal "funds_for_others", precision: 10, scale: 2, null: false
    t.decimal "funds_for_self_development", precision: 10, scale: 2, null: false
    t.decimal "funds_for_expensive_purchase", precision: 10, scale: 2, null: false
    t.decimal "investment_funds", precision: 10, scale: 2, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_envelope_formulas_on_user_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "file", null: false
    t.boolean "share", default: true, null: false
    t.boolean "removed", default: false, null: false
    t.boolean "favorite", default: false, null: false
    t.integer "count_of_views", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "partner_requests", force: :cascade do |t|
    t.string "status", default: "pending", null: false
    t.bigint "invited_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invited_id"], name: "index_partner_requests_on_invited_id"
    t.index ["user_id"], name: "index_partner_requests_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.bigint "phone_number"
    t.string "photo", null: false
    t.string "email"
    t.integer "gender"
    t.datetime "birthday", precision: nil
    t.text "characteristic"
    t.decimal "blue_personality", precision: 10, scale: 2, default: "0.0"
    t.decimal "red_personality", precision: 10, scale: 2, default: "0.0"
    t.decimal "green_personality", precision: 10, scale: 2, default: "0.0"
    t.decimal "yellow_personality", precision: 10, scale: 2, default: "0.0"
    t.bigint "childhood_city_id"
    t.bigint "current_city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["childhood_city_id"], name: "index_people_on_childhood_city_id"
    t.index ["current_city_id"], name: "index_people_on_current_city_id"
  end

  create_table "profits", force: :cascade do |t|
    t.decimal "amount", null: false
    t.decimal "daily_expences"
    t.decimal "funds_for_expensive_purchase"
    t.decimal "funds_for_others"
    t.decimal "funds_for_self_development"
    t.decimal "investment_funds"
    t.decimal "savings"
    t.bigint "user_id", null: false
    t.bigint "envelope_formula_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["envelope_formula_id"], name: "index_profits_on_envelope_formula_id"
    t.index ["user_id"], name: "index_profits_on_user_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.integer "partner_ids", default: [], null: false, array: true
    t.datetime "remember_created_at", precision: nil
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "envelope_formulas", "users"
  add_foreign_key "partner_requests", "users"
  add_foreign_key "partner_requests", "users", column: "invited_id"
  add_foreign_key "people", "cities", column: "childhood_city_id"
  add_foreign_key "people", "cities", column: "current_city_id"
  add_foreign_key "profits", "envelope_formulas"
  add_foreign_key "profits", "users"
end
