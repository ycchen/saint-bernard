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

ActiveRecord::Schema.define(version: 20) do

  create_table "admission_diagnoses", force: :cascade do |t|
    t.integer "admission_id"
    t.integer "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_admission_diagnoses_on_admission_id"
    t.index ["diagnosis_id"], name: "index_admission_diagnoses_on_diagnosis_id"
  end

  create_table "admission_observations", force: :cascade do |t|
    t.integer "admission_id"
    t.integer "observation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_admission_observations_on_admission_id"
    t.index ["observation_id"], name: "index_admission_observations_on_observation_id"
  end

  create_table "admission_symptoms", force: :cascade do |t|
    t.integer "admission_id"
    t.integer "symptom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_admission_symptoms_on_admission_id"
    t.index ["symptom_id"], name: "index_admission_symptoms_on_symptom_id"
  end

  create_table "admissions", force: :cascade do |t|
    t.integer "patient_id"
    t.datetime "moment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_admissions_on_patient_id"
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chronic_conditions", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_chronic_conditions_on_diagnosis_id"
    t.index ["patient_id"], name: "index_chronic_conditions_on_patient_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "coding_system", null: false
    t.string "code", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnostic_procedures", force: :cascade do |t|
    t.text "description", null: false
    t.datetime "moment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_orders", force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit", null: false
    t.decimal "dosage", null: false
    t.integer "route"
    t.integer "frequency_id"
    t.text "necessity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frequency_id"], name: "index_medication_orders_on_frequency_id"
  end

  create_table "observations", force: :cascade do |t|
    t.text "description", null: false
    t.datetime "moment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.string "value", null: false
    t.integer "frequency_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_allergies", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "allergy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allergy_id"], name: "index_patient_allergies_on_allergy_id"
    t.index ["patient_id"], name: "index_patient_allergies_on_patient_id"
  end

  create_table "patient_diagnoses", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_patient_diagnoses_on_diagnosis_id"
    t.index ["patient_id"], name: "index_patient_diagnoses_on_patient_id"
  end

  create_table "patient_diagnostic_procedures", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "diagnostic_procedure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnostic_procedure_id"], name: "index_patient_diagnostic_procedures_on_diagnostic_procedure_id"
    t.index ["patient_id"], name: "index_patient_diagnostic_procedures_on_patient_id"
  end

  create_table "patient_medications", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "medication_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_order_id"], name: "index_patient_medications_on_medication_order_id"
    t.index ["patient_id"], name: "index_patient_medications_on_patient_id"
  end

  create_table "patient_treatments", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "treatment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_treatments_on_patient_id"
    t.index ["treatment_id"], name: "index_patient_treatments_on_treatment_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "facility_id"
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.string "mr", null: false
    t.datetime "dob", null: false
    t.integer "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_patients_on_facility_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.text "description", null: false
    t.text "necessity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
