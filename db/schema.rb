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

ActiveRecord::Schema.define(version: 20160715184048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "cases", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string  "name"
    t.integer "popsicle_varieties"
  end

  create_table "jokes", force: :cascade do |t|
    t.string  "question"
    t.string  "punchline"
    t.integer "dirtiness"
    t.integer "funniness"
    t.string  "author"
    t.integer "stick_id"
  end

  create_table "popsicles", force: :cascade do |t|
    t.string  "flavor"
    t.string  "color"
    t.string  "rating"
    t.string  "shape"
    t.string  "serial_number"
    t.integer "company_id"
    t.string  "status",        default: "U"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "popsicle_id"
    t.string  "response_text"
    t.integer "rating"
  end

  create_table "sticks", force: :cascade do |t|
    t.string  "wood_type"
    t.string  "color"
    t.integer "centimeters"
    t.integer "popsicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birth_year"
    t.string   "password_digest"
    t.string   "email"
    t.string   "role"
  end

end
