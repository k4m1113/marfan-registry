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

ActiveRecord::Schema.define(version: 20161205224935) do

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

  create_table "hospitalizations", force: :cascade do |t|
    t.integer  "visit_id",       null: false
    t.datetime "admission_date"
    t.integer  "length_of_stay"
    t.string   "hosp_type"
    t.string   "description"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "postal_code"
    t.string   "sex",            null: false
    t.datetime "date_of_birth"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "deceased"
    t.boolean  "cause_of_death"
    t.string   "note"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer "seeded_relationship_type_id", null: false
    t.integer "patient_id",                  null: false
    t.integer "relation_patient_id",         null: false
  end

  create_table "seeded_relationship_types", id: false, force: :cascade do |t|
    t.integer  "ahnentafel_id",   null: false
    t.integer  "generation",      null: false
    t.string   "name",            null: false
    t.string   "name_camelcase",  null: false
    t.string   "name_underscore", null: false
    t.string   "description",     null: false
    t.string   "gender",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "seeded_symptoms", force: :cascade do |t|
    t.string  "name"
    t.string  "common_name"
    t.string  "article"
    t.string  "plural"
    t.integer "ghent_value"
    t.integer "beighton_value"
    t.string  "systemic_category"
  end

  create_table "symptoms", force: :cascade do |t|
    t.integer  "seeded_symptom_id", null: false
    t.integer  "visit_id",          null: false
    t.boolean  "presence"
    t.float    "measurement"
    t.datetime "start_date"
    t.string   "frequency"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "visit_id",  null: false
    t.string   "test_type", null: false
    t.string   "result",    null: false
    t.datetime "test_date"
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "patient_id",       null: false
    t.integer  "clinician_id",     null: false
    t.string   "general_health"
    t.float    "height"
    t.float    "weight"
    t.float    "z_score"
    t.string   "primary_reason"
    t.string   "secondary_reason"
    t.float    "upper_segment"
    t.float    "lower_segment"
    t.float    "arm_span"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
