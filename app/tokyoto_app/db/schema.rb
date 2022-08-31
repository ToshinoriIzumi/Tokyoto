# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_31_005359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ages", force: :cascade do |t|
    t.integer "min", null: false
    t.integer "max", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["min", "max"], name: "index_ages_on_min_and_max", unique: true
  end

  create_table "benefits", force: :cascade do |t|
    t.integer "money", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conditions_supports", force: :cascade do |t|
    t.bigint "support_id", null: false
    t.bigint "city_id", null: false
    t.bigint "income_id", null: false
    t.bigint "age_id", null: false
    t.bigint "status_id", null: false
    t.bigint "benefit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["age_id"], name: "index_conditions_supports_on_age_id"
    t.index ["benefit_id"], name: "index_conditions_supports_on_benefit_id"
    t.index ["city_id"], name: "index_conditions_supports_on_city_id"
    t.index ["income_id"], name: "index_conditions_supports_on_income_id"
    t.index ["status_id"], name: "index_conditions_supports_on_status_id"
    t.index ["support_id", "city_id", "income_id", "age_id", "status_id", "benefit_id"], name: "condition_combination", unique: true
    t.index ["support_id"], name: "index_conditions_supports_on_support_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "money", null: false
    t.integer "is_myself", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["money", "is_myself"], name: "index_incomes_on_money_and_is_myself", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supports", force: :cascade do |t|
    t.string "support_name", null: false
    t.text "content", null: false
    t.text "application_method"
    t.string "application_limit"
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "role", default: "0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "conditions_supports", "ages"
  add_foreign_key "conditions_supports", "benefits"
  add_foreign_key "conditions_supports", "cities"
  add_foreign_key "conditions_supports", "incomes"
  add_foreign_key "conditions_supports", "statuses"
  add_foreign_key "conditions_supports", "supports"
end
