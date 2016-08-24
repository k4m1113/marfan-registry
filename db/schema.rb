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

ActiveRecord::Schema.define(version: 20160822202406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinicians", force: :cascade do |t|
    t.string   "first_name",     null: false
    t.string   "last_name",      null: false
    t.string   "practice_name",  null: false
    t.string   "address_line_1", null: false
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city",           null: false
    t.string   "state",          null: false
    t.string   "country",        null: false
    t.integer  "postal_code",    null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name",     null: false
    t.string   "last_name",      null: false
    t.string   "address_line_1", null: false
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city",           null: false
    t.string   "state",          null: false
    t.string   "country",        null: false
    t.integer  "postal_code",    null: false
    t.string   "sex",            null: false
    t.integer  "month_of_birth", null: false
    t.integer  "day_of_birth",   null: false
    t.integer  "year_of_birth",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "seeded_symptoms", force: :cascade do |t|
    t.string  "name"
    t.string  "common_name"
    t.integer "ghent_value"
    t.integer "beighton_value"
    t.string  "systemic_category"
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "patient_id",       null: false
    t.integer  "clinician_id",     null: false
    t.float    "height",           null: false
    t.float    "weight",           null: false
    t.float    "z_score",          null: false
    t.string   "primary_reason",   null: false
    t.string   "secondary_reason"
    t.float    "upper_segment"
    t.float    "lower_segment"
    t.float    "arm_span"
    t.json     "symptoms",                      array: true
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
