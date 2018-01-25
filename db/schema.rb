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

ActiveRecord::Schema.define(version: 2017_07_15_202806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinicians", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "practice_name", null: false
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.string "address_line_3"
    t.string "city", null: false
    t.string "state", null: false
    t.string "country", null: false
    t.integer "postal_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "diagnoses", id: :serial, force: :cascade do |t|
    t.integer "topic_id", null: false
    t.integer "patient_id", null: false
    t.string "time_ago"
    t.datetime "absolute_start_date"
    t.integer "visit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.boolean "present"
    t.string "duration"
    t.string "frequency"
    t.string "attachment"
    t.index ["patient_id"], name: "index_diagnoses_on_patient_id"
    t.index ["topic_id"], name: "index_diagnoses_on_topic_id"
  end

  create_table "dissections", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "visit_id"
    t.bigint "topic_id", null: false
    t.string "location", null: false
    t.string "perfusion"
    t.string "direction"
    t.string "lumen"
    t.datetime "absolute_start_date"
    t.string "time_ago_scale"
    t.integer "time_ago_amount"
    t.string "note"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_dissections_on_patient_id"
    t.index ["topic_id"], name: "index_dissections_on_topic_id"
    t.index ["visit_id"], name: "index_dissections_on_visit_id"
  end

  create_table "family_members", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "future_patient_data_hash"
    t.integer "claimed_patient_id"
    t.integer "patient_id", null: false
    t.integer "visit_id"
    t.integer "born_years_ago"
    t.string "note"
    t.string "time_ago"
    t.string "time_ago_scale"
    t.datetime "death_date"
    t.integer "topic_id", null: false
    t.string "attachment"
    t.index ["patient_id"], name: "index_family_members_on_patient_id"
    t.index ["topic_id"], name: "index_family_members_on_topic_id"
  end

  create_table "genetic_tests", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "visit_id"
    t.string "transcript"
    t.string "protein"
    t.string "variant"
    t.integer "exons"
    t.string "lab_classification"
    t.string "clinical_classification"
    t.boolean "predictive_testing_recommended"
    t.string "lab_name"
    t.date "date"
    t.string "attachment"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_genetic_tests_on_patient_id"
    t.index ["topic_id"], name: "index_genetic_tests_on_topic_id"
    t.index ["visit_id"], name: "index_genetic_tests_on_visit_id"
  end

  create_table "heart_measurements", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "visit_id"
    t.string "measurement"
    t.string "note"
    t.datetime "absolute_start_date"
    t.integer "time_ago"
    t.string "time_ago_scale"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_heart_measurements_on_patient_id"
    t.index ["topic_id"], name: "index_heart_measurements_on_topic_id"
    t.index ["visit_id"], name: "index_heart_measurements_on_visit_id"
  end

  create_table "hospitalizations", id: :serial, force: :cascade do |t|
    t.datetime "admission_date"
    t.integer "length_of_stay"
    t.string "hosp_type"
    t.string "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id", null: false
    t.integer "visit_id"
    t.string "time_ago"
    t.string "time_ago_scale"
    t.string "length_of_stay_scale"
    t.string "note"
    t.integer "topic_id", null: false
    t.string "attachment"
    t.index ["patient_id"], name: "index_hospitalizations_on_patient_id"
    t.index ["topic_id"], name: "index_hospitalizations_on_topic_id"
  end

  create_table "medications", id: :serial, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "visit_id"
    t.decimal "dose"
    t.string "dose_unit_of_measurement"
    t.integer "nested_med_id"
    t.integer "nested_med_category"
    t.integer "duration_amount"
    t.string "duration_scale"
    t.string "ingestion_method"
    t.integer "frequency"
    t.string "frequency_scale"
    t.string "common_name"
    t.string "medication_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_ago"
    t.string "time_ago_scale"
    t.datetime "absolute_start_date"
    t.string "note"
    t.string "name"
    t.string "dosage_form"
    t.integer "dosage_form_units"
    t.integer "topic_id"
    t.boolean "current"
    t.string "attachment"
    t.index ["patient_id"], name: "index_medications_on_patient_id"
  end

  create_table "patients", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.string "address_line_3"
    t.string "city", null: false
    t.string "state", null: false
    t.string "country", null: false
    t.string "postal_code", null: false
    t.string "sex", null: false
    t.datetime "date_of_birth", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deceased", default: false, null: false
    t.string "cause_of_death"
    t.string "note"
    t.string "phone_1", null: false
    t.string "phone_2"
    t.string "email", null: false
    t.string "middle_name"
    t.string "primary_diagnosis"
    t.string "attachment"
  end

  create_table "pg_search_documents", id: :serial, force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.integer "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "procedures", id: :serial, force: :cascade do |t|
    t.integer "topic_id", null: false
    t.integer "patient_id", null: false
    t.integer "clinician_id"
    t.integer "visit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.string "time_ago"
    t.string "time_ago_scale"
    t.datetime "absolute_start_date"
    t.string "attachment"
    t.index ["clinician_id"], name: "index_procedures_on_clinician_id"
    t.index ["patient_id"], name: "index_procedures_on_patient_id"
    t.index ["topic_id"], name: "index_procedures_on_topic_id"
  end

  create_table "tests", id: :serial, force: :cascade do |t|
    t.string "result"
    t.datetime "absolute_start_date"
    t.integer "patient_id", null: false
    t.integer "visit_id"
    t.string "time_ago"
    t.string "time_ago_scale"
    t.integer "topic_id", null: false
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.index ["patient_id"], name: "index_tests_on_patient_id"
    t.index ["topic_id"], name: "index_tests_on_topic_id"
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.string "topic_type", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.float "min_value"
    t.float "max_value"
    t.float "step"
    t.string "units_of_measurement", array: true
    t.string "descriptors", array: true
    t.integer "related", array: true
    t.string "part_of_speech"
    t.index ["lft"], name: "index_topics_on_lft"
    t.index ["parent_id"], name: "index_topics_on_parent_id"
    t.index ["rgt"], name: "index_topics_on_rgt"
  end

  create_table "visits", id: :serial, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "clinician_id", null: false
    t.string "general_health"
    t.string "primary_reason"
    t.string "secondary_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinician_id"], name: "index_visits_on_clinician_id"
    t.index ["patient_id"], name: "index_visits_on_patient_id"
  end

  create_table "vitals", id: :serial, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "topic_id", null: false
    t.integer "visit_id"
    t.string "measurement"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_vitals_on_patient_id"
    t.index ["topic_id"], name: "index_vitals_on_topic_id"
  end

end
