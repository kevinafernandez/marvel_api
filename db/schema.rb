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

ActiveRecord::Schema.define(version: 2018_10_19_022859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "api_marvel_apis", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer "poder_ataque"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "ha_peleado", default: false
  end

  create_table "marvels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peleas", force: :cascade do |t|
    t.bigint "persona_id"
    t.bigint "character_id"
    t.datetime "hora_pelea"
    t.boolean "ganador_persona"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_peleas_on_character_id"
    t.index ["persona_id"], name: "index_peleas_on_persona_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "poder_ataque", default: 0
    t.integer "puntos_acumulados", default: 0
    t.integer "peleas_ganadas_dia", default: 0
    t.boolean "esta_vivo", default: true
  end

  create_table "rankings", force: :cascade do |t|
    t.bigint "persona_id"
    t.bigint "character_id"
    t.integer "triunfos", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_rankings_on_character_id"
    t.index ["persona_id"], name: "index_rankings_on_persona_id"
  end

  add_foreign_key "peleas", "characters"
  add_foreign_key "peleas", "personas"
  add_foreign_key "rankings", "characters"
  add_foreign_key "rankings", "personas"
end
