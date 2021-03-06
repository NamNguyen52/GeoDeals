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

ActiveRecord::Schema.define(version: 20141107192221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.string   "fine"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
  end

  create_table "lists", force: true do |t|
    t.string   "created_at"
    t.string   "updated_at"
    t.integer  "user_id"
    t.string   "deal_id"
    t.string   "deal_name"
    t.string   "deal_description"
    t.string   "deal_code"
    t.string   "deal_fine"
    t.string   "deal_date"
    t.string   "deal_time"
    t.datetime "deal_end_datetime"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "customer"
    t.boolean  "business_owner"
    t.integer  "business_id"
  end

end
