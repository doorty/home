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

ActiveRecord::Schema.define(version: 20130906201749) do

  create_table "appointments", force: true do |t|
    t.integer  "care_circle_id"
    t.string   "title"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.time     "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id"

  create_table "care_circles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "caregivers", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "gender"
    t.string   "language"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "description"
    t.integer  "age"
    t.integer  "years_of_experience"
    t.string   "occupation"
    t.boolean  "insured"
    t.boolean  "bonded"
    t.boolean  "reviewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charts", force: true do |t|
    t.integer  "care_circle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charts", ["care_circle_id"], name: "index_charts_on_care_circle_id"

  create_table "doctors", force: true do |t|
    t.integer  "care_circle_id"
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "doctors", ["care_circle_id"], name: "index_doctors_on_care_circle_id"

  create_table "medication_reminders", force: true do |t|
    t.integer  "medication_id"
    t.string   "days"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medication_reminders", ["medication_id"], name: "index_medication_reminders_on_medication_id"

  create_table "medications", force: true do |t|
    t.integer  "care_circle_id"
    t.string   "name"
    t.string   "strength"
    t.string   "dosage"
    t.integer  "doctor_id"
    t.decimal  "savings",        precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medications", ["care_circle_id"], name: "index_medications_on_care_circle_id"

  create_table "notes", force: true do |t|
    t.integer  "care_circle_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["care_circle_id"], name: "index_notes_on_care_circle_id"

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "relationship_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "care_circle_id"
    t.integer  "relationship_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string  "name"
    t.integer "access_level"
    t.string  "timestamps"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "statuses", force: true do |t|
    t.integer  "care_circle_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token",       limit: 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
