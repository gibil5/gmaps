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

ActiveRecord::Schema.define(version: 20140923171540) do

  create_table "maps", force: true do |t|
    t.string   "name"
    t.string   "map_type"
    t.string   "created_by"
    t.string   "last_updated_by"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: true do |t|
    t.integer  "map_id"
    t.string   "point_type"
    t.string   "point_subtype"
    t.string   "name"
    t.string   "lat_dec"
    t.string   "lng_dec"
    t.string   "info"
    t.string   "created_by"
    t.string   "last_updated_by"
    t.string   "ad_number"
    t.string   "ad_street"
    t.string   "ad_district"
    t.string   "ad_phone_1"
    t.string   "ad_phone_2"
    t.string   "ad_reference"
    t.string   "open_hours"
    t.string   "email"
    t.string   "www"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.integer  "map_id"
    t.string   "point_type"
    t.string   "point_subtype"
    t.string   "name"
    t.string   "lat_dec"
    t.string   "lng_dec"
    t.string   "info"
    t.string   "created_by"
    t.string   "last_updated_by"
    t.string   "ad_number"
    t.string   "ad_street"
    t.string   "ad_district"
    t.string   "ad_phone_1"
    t.string   "ad_phone_2"
    t.string   "ad_reference"
    t.string   "open_hours"
    t.string   "email"
    t.string   "www"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
