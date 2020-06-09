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

ActiveRecord::Schema.define(version: 2019_06_02_015336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.boolean "present", default: true
    t.boolean "late"
    t.bigint "lesson_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "student_id"], name: "index_attendances_on_lesson_id_and_student_id", unique: true
    t.index ["lesson_id"], name: "index_attendances_on_lesson_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "school"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.text "comment"
    t.boolean "approved", default: false
    t.bigint "mistake_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "teacher_feedback"
    t.boolean "completed", default: false
    t.index ["mistake_id"], name: "index_homeworks_on_mistake_id"
    t.index ["student_id"], name: "index_homeworks_on_student_id"
  end

  create_table "interested_users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "learning_goal"
    t.integer "time_goal"
    t.datetime "start_time", default: "2020-05-24 14:09:57"
    t.datetime "end_time"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
  end

  create_table "mistakes", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "time_trial_id"
    t.float "seconds"
    t.index ["time_trial_id"], name: "index_mistakes_on_time_trial_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "student_number"
    t.integer "score"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "time_trials", force: :cascade do |t|
    t.integer "seconds"
    t.string "audio"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "attendance_a_id"
    t.bigint "attendance_b_id"
    t.boolean "completed", default: false
    t.datetime "started_at"
    t.index ["lesson_id"], name: "index_time_trials_on_lesson_id"
  end

  add_foreign_key "attendances", "lessons"
  add_foreign_key "attendances", "students"
  add_foreign_key "courses", "teachers"
  add_foreign_key "homeworks", "mistakes"
  add_foreign_key "homeworks", "students"
  add_foreign_key "lessons", "courses"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "mistakes", "time_trials"
  add_foreign_key "students", "courses"
  add_foreign_key "time_trials", "lessons"
end
