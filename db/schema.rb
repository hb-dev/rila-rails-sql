# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141113130359) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "event_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: true do |t|
    t.integer  "run_id"
    t.integer  "startnumber"
    t.integer  "transponder"
    t.time     "finishtime"
    t.string   "runner_title"
    t.string   "runner_name"
    t.string   "runner_firstname"
    t.string   "runner_street"
    t.string   "runner_city"
    t.string   "runner_zip"
    t.string   "runner_country"
    t.date     "runner_date_of_birth"
    t.string   "runner_gender"
    t.string   "runner_contact"
    t.string   "runner_email"
    t.string   "runner_organisation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "relay_id"
  end

  create_table "relays", force: true do |t|
    t.integer  "run_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_title"
    t.string   "contact_name"
    t.string   "contact_firstname"
    t.string   "contact_street"
    t.string   "contact_city"
    t.string   "contact_zip"
    t.string   "contact_country"
    t.string   "contact_email"
  end

  create_table "runs", force: true do |t|
    t.string   "name"
    t.integer  "min_age"
    t.integer  "max_age"
    t.boolean  "relay"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

end
