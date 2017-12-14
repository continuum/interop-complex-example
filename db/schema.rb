# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171212154923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "personas", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  create_table "telefonos", force: :cascade do |t|
    t.integer  "numero"
    t.integer  "persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_telefonos_on_persona_id", using: :btree
  end

  create_table "trace_infos", force: :cascade do |t|
    t.datetime "time"
    t.string   "remote_host_ip"
    t.string   "interop_service_requested"
    t.string   "http_method"
    t.string   "url"
    t.string   "response_http_code"
    t.string   "consumer_institution_code"
    t.string   "oid_identifier"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
