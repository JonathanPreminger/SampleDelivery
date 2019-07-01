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

ActiveRecord::Schema.define(version: 2019_07_01_162247) do

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.text "message"
    t.text "email"
  end

  create_table "djs", force: :cascade do |t|
    t.text "name"
    t.integer "release_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_djs_on_event_id"
    t.index ["release_id"], name: "index_djs_on_release_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "revenue_figure"
    t.integer "total_charge_dj"
    t.integer "charge_communication"
    t.integer "charge_others"
    t.text "charge_others_description"
    t.integer "number_of_dj"
    t.text "line_up"
    t.string "place"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "benefits"
  end

  create_table "releases", force: :cascade do |t|
    t.text "name"
    t.text "year"
    t.text "tracks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
