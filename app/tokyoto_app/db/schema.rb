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

ActiveRecord::Schema.define(version: 2023_01_02_100226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ages", force: :cascade do |t|
    t.integer "min", null: false
    t.integer "max", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["min", "max"], name: "index_ages_on_min_and_max", unique: true
  end

  create_table "children", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.index ["latitude", "longitude"], name: "index_cities_on_latitude_and_longitude", unique: true
  end

  create_table "conditions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conditions_supports", primary_key: ["condition_id", "support_id"], force: :cascade do |t|
    t.bigint "condition_id", null: false
    t.bigint "support_id", null: false
    t.bigint "city_id", null: false
    t.string "payment", null: false
    t.bigint "income_id", null: false
    t.bigint "age_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["age_id"], name: "index_conditions_supports_on_age_id"
    t.index ["city_id"], name: "index_conditions_supports_on_city_id"
    t.index ["condition_id"], name: "index_conditions_supports_on_condition_id"
    t.index ["income_id"], name: "index_conditions_supports_on_income_id"
    t.index ["support_id"], name: "index_conditions_supports_on_support_id"
  end

  create_table "conditions_supports_statuses", force: :cascade do |t|
    t.bigint "condition_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["condition_id"], name: "index_conditions_supports_statuses_on_condition_id"
    t.index ["status_id"], name: "index_conditions_supports_statuses_on_status_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.string "name", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
    t.string "phone_number"
    t.index ["address"], name: "index_hospitals_on_address", unique: true
    t.index ["city_id"], name: "index_hospitals_on_city_id"
    t.index ["latitude", "longitude"], name: "index_hospitals_on_latitude_and_longitude", unique: true
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "money", null: false
    t.integer "is_myself", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["money", "is_myself"], name: "index_incomes_on_money_and_is_myself", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_statuses_on_status", unique: true
  end

  create_table "support_tags", force: :cascade do |t|
    t.bigint "support_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["support_id"], name: "index_support_tags_on_support_id"
    t.index ["tag_id"], name: "index_support_tags_on_tag_id"
  end

  create_table "supports", force: :cascade do |t|
    t.string "support_name", null: false
    t.text "content", null: false
    t.text "application_method"
    t.string "application_limit"
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["support_name"], name: "index_supports_on_support_name", unique: true
    t.index ["url"], name: "index_supports_on_url", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.integer "city_id"
    t.integer "income"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "children", "users"
  add_foreign_key "conditions_supports", "ages"
  add_foreign_key "conditions_supports", "cities"
  add_foreign_key "conditions_supports", "conditions"
  add_foreign_key "conditions_supports", "incomes"
  add_foreign_key "conditions_supports", "supports"
  add_foreign_key "conditions_supports_statuses", "conditions"
  add_foreign_key "conditions_supports_statuses", "statuses"
  add_foreign_key "hospitals", "cities"
  add_foreign_key "support_tags", "supports"
  add_foreign_key "support_tags", "tags"
end
