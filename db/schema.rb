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

ActiveRecord::Schema.define(version: 20190507205446) do

  create_table "coaches", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "team"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "birthday"
    t.string   "phone"
    t.string   "school"
    t.integer  "age_level"
    t.integer  "tryout_number"
    t.string   "position"
  end

  create_table "tryouts", force: :cascade do |t|
    t.integer "player_id"
    t.integer "coach_id"
    t.string  "season"
    t.integer "age_level"
    t.integer "tryout_number"
    t.integer "player_height"
    t.string  "player_position"
    t.integer "passing"
    t.integer "setting"
    t.integer "hitting"
    t.integer "emotions"
    t.integer "talking"
    t.integer "learning"
  end

end
