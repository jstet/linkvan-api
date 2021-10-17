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

ActiveRecord::Schema.define(version: 2021_10_17_201435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analytics", id: :serial, force: :cascade do |t|
    t.string "sessionID"
    t.datetime "time"
    t.string "cookieID"
    t.string "service", null: false
    t.decimal "lat", null: false
    t.decimal "long", null: false
    t.decimal "facility"
    t.boolean "dirClicked", default: false
    t.string "dirType"
  end

  create_table "anaylitics", id: :serial, force: :cascade do |t|
    t.decimal "lat"
    t.decimal "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "lat"
    t.decimal "long"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.text "description"
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "r_pets", default: false
    t.boolean "r_id", default: false
    t.boolean "r_cart", default: false
    t.boolean "r_phone", default: false
    t.boolean "r_wifi", default: false
    t.integer "user_id"
    t.boolean "verified", default: false
    t.text "shelter_note"
    t.text "food_note"
    t.text "medical_note"
    t.text "hygiene_note"
    t.text "technology_note"
    t.text "legal_note"
    t.text "learning_note"
    t.integer "zone_id"
    t.text "overdose_note"
    t.index ["user_id"], name: "index_facilities_on_user_id"
    t.index ["zone_id"], name: "index_facilities_on_zone_id"
  end

  create_table "facility_schedules", force: :cascade do |t|
    t.bigint "facility_id"
    t.string "week_day", null: false
    t.boolean "open_all_day", default: false, null: false
    t.boolean "closed_all_day", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id", "week_day"], name: "index_facility_schedules_on_facility_id_and_week_day", unique: true
    t.index ["facility_id"], name: "index_facility_schedules_on_facility_id"
  end

  create_table "facility_services", force: :cascade do |t|
    t.bigint "facility_id", null: false
    t.bigint "service_id", null: false
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id", "service_id"], name: "index_facility_services_on_facility_id_and_service_id", unique: true
    t.index ["facility_id"], name: "index_facility_services_on_facility_id"
    t.index ["service_id"], name: "index_facility_services_on_service_id"
  end

  create_table "facility_time_slots", force: :cascade do |t|
    t.bigint "facility_schedule_id"
    t.integer "from_hour", null: false
    t.integer "from_min", null: false
    t.integer "to_hour", null: false
    t.integer "to_min", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_schedule_id"], name: "index_facility_time_slots_on_facility_schedule_id"
  end

  create_table "facility_welcomes", force: :cascade do |t|
    t.bigint "facility_id", null: false
    t.string "customer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id", "customer"], name: "index_facility_welcomes_on_facility_id_and_customer", unique: true
    t.index ["facility_id"], name: "index_facility_welcomes_on_facility_id"
  end

  create_table "impressions", id: :serial, force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "listed_options", id: :serial, force: :cascade do |t|
    t.integer "analytic_id"
    t.string "sessionID", null: false
    t.datetime "time", null: false
    t.string "facility", null: false
    t.decimal "position", null: false
    t.decimal "total", null: false
    t.index ["analytic_id"], name: "index_listed_options_on_analytic_id"
  end

  create_table "notices", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "content"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notice_type"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_services_on_name", unique: true
  end

  create_table "statuses", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fid"
    t.string "changetype"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
    t.boolean "activation_email_sent", default: false
    t.string "phone_number"
    t.boolean "verified", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_zones", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "zone_id", null: false
    t.index ["user_id", "zone_id"], name: "index_users_zones_on_user_id_and_zone_id"
    t.index ["zone_id", "user_id"], name: "index_users_zones_on_zone_id_and_user_id"
  end

  create_table "zones", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "facilities", "zones"
  add_foreign_key "facility_services", "facilities"
  add_foreign_key "facility_services", "services"
  add_foreign_key "facility_welcomes", "facilities"
end
