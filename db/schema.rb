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

ActiveRecord::Schema[7.0].define(version: 2022_07_08_133528) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configurations", force: :cascade do |t|
    t.integer "_id"
    t.integer "launch_library_id"
    t.string "url"
    t.string "name"
    t.string "family"
    t.string "full_name"
    t.string "variant"
    t.bigint "rocket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rocket_id"], name: "index_configurations_on_rocket_id"
  end

  create_table "launch_service_providers", force: :cascade do |t|
    t.integer "_id"
    t.string "url"
    t.string "name"
    t.string "type"
    t.bigint "launcher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["launcher_id"], name: "index_launch_service_providers_on_launcher_id"
  end

  create_table "launcher_statuses", force: :cascade do |t|
    t.integer "_id"
    t.string "name"
    t.bigint "launcher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["launcher_id"], name: "index_launcher_statuses_on_launcher_id"
  end

  create_table "launchers", force: :cascade do |t|
    t.string "_id"
    t.string "url"
    t.string "launch_library_id"
    t.string "slug"
    t.string "name"
    t.string "net"
    t.datetime "window_end"
    t.datetime "window_start"
    t.boolean "inhold"
    t.boolean "tbdtime"
    t.boolean "tbddate"
    t.integer "probability"
    t.string "holdreason"
    t.string "failreason"
    t.string "hashtag"
    t.boolean "webcast_live"
    t.string "image"
    t.string "infographic"
    t.string "program", array: true
    t.datetime "imported_t"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url", "name", "program"], name: "index_launchers_on_url_and_name_and_program"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "_id"
    t.string "url"
    t.string "name"
    t.string "country_code"
    t.string "map_image"
    t.integer "total_launch_count"
    t.integer "total_landing_count"
    t.bigint "pad_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pad_id"], name: "index_locations_on_pad_id"
  end

  create_table "missions", force: :cascade do |t|
    t.integer "_id"
    t.string "name"
    t.bigint "launcher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["launcher_id"], name: "index_missions_on_launcher_id"
  end

  create_table "pads", force: :cascade do |t|
    t.integer "_id"
    t.string "url"
    t.string "agency_id"
    t.string "name"
    t.string "info_url"
    t.string "wiki_url"
    t.string "map_url"
    t.string "latitude"
    t.string "longitude"
    t.string "map_image"
    t.integer "total_launch_count"
    t.bigint "launcher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["launcher_id"], name: "index_pads_on_launcher_id"
  end

  create_table "rockets", force: :cascade do |t|
    t.integer "_id"
    t.bigint "launcher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["launcher_id"], name: "index_rockets_on_launcher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "configurations", "rockets"
  add_foreign_key "launch_service_providers", "launchers"
  add_foreign_key "launcher_statuses", "launchers"
  add_foreign_key "locations", "pads"
  add_foreign_key "missions", "launchers"
  add_foreign_key "pads", "launchers"
  add_foreign_key "rockets", "launchers"
end
