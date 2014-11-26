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

ActiveRecord::Schema.define(version: 20141126181740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "authorable_assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["authorable_assignment_id"], name: "index_assignments_on_authorable_assignment_id", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "assignments_problems", id: false, force: true do |t|
    t.integer "assignment_id", null: false
    t.integer "problem_id",    null: false
  end

  add_index "assignments_problems", ["assignment_id", "problem_id"], name: "index_assignments_problems_on_assignment_id_and_problem_id", using: :btree
  add_index "assignments_problems", ["problem_id", "assignment_id"], name: "index_assignments_problems_on_problem_id_and_assignment_id", using: :btree

  create_table "authorable_assignments", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorable_assignments", ["user_id"], name: "index_authorable_assignments_on_user_id", using: :btree

  create_table "authorable_problems", force: true do |t|
    t.integer  "user_id"
    t.text     "problem_text"
    t.text     "solution_diagram"
    t.text     "solution_model"
    t.text     "partial_solution"
    t.integer  "style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorable_problems", ["user_id"], name: "index_authorable_problems_on_user_id", using: :btree

  create_table "instructors_students", id: false, force: true do |t|
    t.integer "instructor_id", null: false
    t.integer "student_id",    null: false
  end

  add_index "instructors_students", ["instructor_id", "student_id"], name: "index_instructors_students_on_instructor_id_and_student_id", using: :btree
  add_index "instructors_students", ["student_id", "instructor_id"], name: "index_instructors_students_on_student_id_and_instructor_id", using: :btree

  create_table "problems", force: true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.integer  "authorable_problem_id"
    t.boolean  "completed"
    t.integer  "attempts"
    t.text     "last_attempt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problems", ["assignment_id"], name: "index_problems_on_assignment_id", using: :btree
  add_index "problems", ["authorable_problem_id"], name: "index_problems_on_authorable_problem_id", using: :btree
  add_index "problems", ["user_id"], name: "index_problems_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

end
