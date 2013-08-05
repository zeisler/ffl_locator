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

ActiveRecord::Schema.define(version: 20130802214913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dealers", force: true do |t|
    t.integer  "licence_id"
    t.string   "licence_name"
    t.string   "business_name"
    t.string   "city"
    t.string   "street"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "phone"
    t.decimal  "lat",           precision: 9, scale: 6
    t.decimal  "lng",           precision: 9, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licences", force: true do |t|
    t.text     "usage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
