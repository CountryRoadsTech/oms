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

ActiveRecord::Schema[7.0].define(version: 2022_07_31_154727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "rmp_flamegraphs", force: :cascade do |t|
    t.bigint "rmp_profiled_request_id", null: false
    t.binary "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rmp_profiled_request_id"], name: "index_rmp_flamegraphs_on_rmp_profiled_request_id"
  end

  create_table "rmp_profiled_requests", force: :cascade do |t|
    t.string "user_id"
    t.bigint "start"
    t.bigint "finish"
    t.integer "duration"
    t.bigint "allocations"
    t.string "request_path"
    t.string "request_query_string"
    t.string "request_method"
    t.json "request_headers"
    t.text "request_body"
    t.integer "response_status"
    t.text "response_body"
    t.json "response_headers"
    t.string "response_media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_rmp_profiled_requests_on_created_at"
  end

  create_table "rmp_traces", force: :cascade do |t|
    t.bigint "rmp_profiled_request_id", null: false
    t.string "name"
    t.bigint "start"
    t.bigint "finish"
    t.integer "duration"
    t.bigint "allocations"
    t.json "payload"
    t.json "backtrace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rmp_profiled_request_id"], name: "index_rmp_traces_on_rmp_profiled_request_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "rmp_flamegraphs", "rmp_profiled_requests"
  add_foreign_key "rmp_traces", "rmp_profiled_requests"
end
