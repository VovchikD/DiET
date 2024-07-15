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

ActiveRecord::Schema[7.0].define(version: 2024_07_14_081105) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diet_meals", force: :cascade do |t|
    t.bigint "diet_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diet_id"], name: "index_diet_meals_on_diet_id"
    t.index ["meal_id"], name: "index_diet_meals_on_meal_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.datetime "eaten_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "report_configurations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "daily_reports", default: false, null: false
    t.boolean "weekly_reports", default: false, null: false
    t.boolean "monthly_reports", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_report_configurations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "auth_token"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diet_meals", "diets"
  add_foreign_key "diet_meals", "meals"
  add_foreign_key "diets", "users"
  add_foreign_key "report_configurations", "users"
end
