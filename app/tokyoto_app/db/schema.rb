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

ActiveRecord::Schema.define(version: 2023_03_02_112928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addinfo_applications", force: :cascade do |t|
    t.string "info_content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "addinfo_conditions_supports", force: :cascade do |t|
    t.string "info_content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ages", force: :cascade do |t|
    t.integer "min", null: false
    t.integer "max", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["min", "max"], name: "index_ages_on_min_and_max", unique: true
  end

  create_table "application_forms", force: :cascade do |t|
    t.string "application_form_name", null: false
    t.string "application_form_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "application_methods", force: :cascade do |t|
    t.string "application_method", null: false
    t.integer "method_order", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "children", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "birth", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sibling_conposition", default: 0
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

  create_table "conditions_supports", force: :cascade do |t|
    t.bigint "condition_id", null: false
    t.bigint "support_id", null: false
    t.bigint "city_id", null: false
    t.integer "payment", null: false
    t.bigint "age_id", null: false
    t.string "url", null: false
    t.integer "payment_limit", default: 0, null: false
    t.integer "payment_frequency", default: 0, null: false
    t.string "payment_month"
    t.string "transfer_destination"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_application_limit"
    t.string "user_renewal_method"
    t.string "user_renewal_month"
    t.string "contact_information"
    t.index ["age_id"], name: "index_conditions_supports_on_age_id"
    t.index ["city_id"], name: "index_conditions_supports_on_city_id"
    t.index ["condition_id", "support_id"], name: "index_conditions_supports_on_condition_id_and_support_id", unique: true
    t.index ["condition_id"], name: "index_conditions_supports_on_condition_id"
    t.index ["support_id"], name: "index_conditions_supports_on_support_id"
  end

  create_table "conditions_supports_addinfo_applications", force: :cascade do |t|
    t.bigint "addinfo_application_id", null: false
    t.bigint "conditions_support_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addinfo_application_id"], name: "addinfo_application_CN_intermediate_table"
    t.index ["conditions_support_id"], name: "conditions_supports_AA_intermediate_table"
  end

  create_table "conditions_supports_addinfo_conditions_supports", force: :cascade do |t|
    t.bigint "addinfo_conditions_support_id", null: false
    t.bigint "conditions_support_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addinfo_conditions_support_id"], name: "addinfo_conditions_support_CN_intermediate_table"
    t.index ["conditions_support_id"], name: "conditions_supports_ACS_intermediate_table"
  end

  create_table "conditions_supports_applications_forms", force: :cascade do |t|
    t.bigint "application_form_id", null: false
    t.bigint "conditions_support_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_form_id"], name: "applications_form_CN_intermediate_table"
    t.index ["conditions_support_id"], name: "conditions_supports_AF_intermediate_table"
  end

  create_table "conditions_supports_applications_methods", force: :cascade do |t|
    t.bigint "application_method_id", null: false
    t.bigint "conditions_support_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_method_id"], name: "applications_method_CN_intermediate_table"
    t.index ["conditions_support_id"], name: "conditions_supports_AP_intermediate_table"
  end

  create_table "conditions_supports_incomes", force: :cascade do |t|
    t.bigint "conditions_support_id", null: false
    t.bigint "income_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conditions_support_id"], name: "index_conditions_supports_incomes_on_conditions_support_id"
    t.index ["income_id"], name: "index_conditions_supports_incomes_on_income_id"
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
    t.integer "is_myself", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "min", null: false
    t.integer "max", null: false
    t.index ["min", "max", "is_myself"], name: "index_incomes_on_min_and_max_and_is_myself", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_statuses_on_status", unique: true
  end

  create_table "supports", force: :cascade do |t|
    t.string "support_name", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "publish_state", default: 0, null: false
    t.index ["support_name"], name: "index_supports_on_support_name", unique: true
  end

  create_table "supports_tags", force: :cascade do |t|
    t.bigint "support_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["support_id"], name: "index_supports_tags_on_support_id"
    t.index ["tag_id"], name: "index_supports_tags_on_tag_id"
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
    t.integer "role", default: 0, null: false
    t.string "user_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "city_id"
    t.integer "income"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "children", "users"
  add_foreign_key "conditions_supports", "ages"
  add_foreign_key "conditions_supports", "cities"
  add_foreign_key "conditions_supports", "conditions"
  add_foreign_key "conditions_supports", "supports"
  add_foreign_key "conditions_supports_addinfo_applications", "addinfo_applications"
  add_foreign_key "conditions_supports_addinfo_applications", "conditions_supports"
  add_foreign_key "conditions_supports_addinfo_conditions_supports", "addinfo_conditions_supports"
  add_foreign_key "conditions_supports_addinfo_conditions_supports", "conditions_supports"
  add_foreign_key "conditions_supports_applications_forms", "application_forms"
  add_foreign_key "conditions_supports_applications_forms", "conditions_supports"
  add_foreign_key "conditions_supports_applications_methods", "application_methods"
  add_foreign_key "conditions_supports_applications_methods", "conditions_supports"
  add_foreign_key "conditions_supports_incomes", "conditions_supports"
  add_foreign_key "conditions_supports_incomes", "incomes"
  add_foreign_key "conditions_supports_statuses", "conditions"
  add_foreign_key "conditions_supports_statuses", "statuses"
  add_foreign_key "hospitals", "cities"
  add_foreign_key "supports_tags", "supports"
  add_foreign_key "supports_tags", "tags"
end
