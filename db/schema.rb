# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_18_160222) do

  create_table "daily_sheets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_member_id"
    t.bigint "staff_member_id"
    t.bigint "subject_id"
    t.date "study_date", null: false
    t.integer "period", null: false
    t.text "message"
    t.text "information"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["staff_member_id"], name: "index_daily_sheets_on_staff_member_id"
    t.index ["student_member_id"], name: "index_daily_sheets_on_student_member_id"
    t.index ["subject_id"], name: "index_daily_sheets_on_subject_id"
  end

  create_table "daily_texts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "daily_sheet_id"
    t.bigint "textbook_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_sheet_id"], name: "index_daily_texts_on_daily_sheet_id"
    t.index ["textbook_id"], name: "index_daily_texts_on_textbook_id"
  end

  create_table "goal_sheets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_member_id"
    t.bigint "staff_member_id"
    t.string "name", null: false
    t.integer "number_of_lessons", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["staff_member_id"], name: "index_goal_sheets_on_staff_member_id"
    t.index ["student_member_id"], name: "index_goal_sheets_on_student_member_id"
  end

  create_table "parent_members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.integer "gender", null: false
    t.date "birthday", null: false
    t.string "password_digest", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "semesters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staff_members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.integer "gender", null: false
    t.date "birthday", null: false
    t.string "password_digest", null: false
    t.string "email", null: false
    t.integer "employment_status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.integer "gender", null: false
    t.date "birthday", null: false
    t.string "password_digest", null: false
    t.integer "school_type", null: false
    t.integer "school_year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "takes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_member_id"
    t.bigint "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_member_id"], name: "index_takes_on_student_member_id"
    t.index ["subject_id"], name: "index_takes_on_subject_id"
  end

  create_table "textbooks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "text_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "daily_sheets", "staff_members"
  add_foreign_key "daily_sheets", "student_members"
  add_foreign_key "daily_sheets", "subjects"
  add_foreign_key "daily_texts", "daily_sheets"
  add_foreign_key "daily_texts", "textbooks"
  add_foreign_key "goal_sheets", "staff_members"
  add_foreign_key "goal_sheets", "student_members"
  add_foreign_key "takes", "student_members"
  add_foreign_key "takes", "subjects"
end
