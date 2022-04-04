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

ActiveRecord::Schema[7.0].define(version: 2022_04_04_162614) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.integer "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "call_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.string "method"
    t.string "queryparameters"
    t.string "xmlparameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calls", force: :cascade do |t|
    t.string "req_body"
    t.string "req_endpoint"
    t.string "req_verb"
    t.integer "resp_status"
    t.text "resp_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "req", default: false
    t.string "name"
  end

  create_table "cti_monitor_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.string "queryparameters"
    t.string "method"
    t.string "xmlparameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.text "queryparameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_status_monitor_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.string "method"
    t.string "queryparameters"
    t.string "xmlparameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_apis", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.string "method"
    t.string "queryparameters"
    t.string "xmlparameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "management_apis", force: :cascade do |t|
    t.string "endpoint"
    t.string "method"
    t.string "queryparameters"
    t.string "xmlparameters"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  create_table "monitoring_apis", force: :cascade do |t|
    t.string "name"
    t.json "queryparameters"
    t.json "querystrparameters"
    t.string "guidelines"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
