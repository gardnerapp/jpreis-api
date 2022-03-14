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

ActiveRecord::Schema.define(version: 2022_03_14_123127) do

  create_table "call_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.string "method"
    t.string "queryparameters"
    t.string "xmlparameters"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "calls", force: :cascade do |t|
    t.string "req_body"
    t.string "req_endpoint"
    t.string "req_verb"
    t.integer "resp_status"
    t.text "resp_body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cti_monitor_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.string "queryparameters"
    t.string "method"
    t.string "xmlparameters"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "data_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.text "queryparameters"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "data_status_monitor_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.string "method"
    t.string "queryparameters"
    t.string "xmlparameters"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "device_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.string "method"
    t.string "queryparameters"
    t.string "xmlparameters"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "management_apis", force: :cascade do |t|
    t.string "endpoint"
    t.string "method"
    t.string "queryparameters"
    t.string "xmlparameters"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
  end

  create_table "monitoring_apis", force: :cascade do |t|
    t.string "name"
    t.json "queryparameters"
    t.json "querystrparameters"
    t.string "guidelines"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
