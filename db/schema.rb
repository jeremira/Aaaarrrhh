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

ActiveRecord::Schema.define(version: 20180728125818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fights", force: :cascade do |t|
    t.bigint "pirate_a_id"
    t.bigint "pirate_b_id"
    t.integer "winner", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pirate_a_id"], name: "index_fights_on_pirate_a_id"
    t.index ["pirate_b_id"], name: "index_fights_on_pirate_b_id"
  end

  create_table "pirates", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "dmg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fight_id"
    t.index ["fight_id"], name: "index_steps_on_fight_id"
  end

  add_foreign_key "fights", "pirates", column: "pirate_a_id"
  add_foreign_key "fights", "pirates", column: "pirate_b_id"
end
