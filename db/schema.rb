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

ActiveRecord::Schema.define(version: 2021_12_13_004021) do

  create_table "daily_sheets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_member_id"
    t.bigint "staff_member_id"
    t.bigint "subject_id"
    t.bigint "textbook_id"
    t.date "study_date", null: false
    t.text "message", null: false
    t.text "information", null: false
    t.integer "participation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "period_id"
    t.index ["period_id"], name: "index_daily_sheets_on_period_id"
    t.index ["staff_member_id"], name: "index_daily_sheets_on_staff_member_id"
    t.index ["student_member_id"], name: "index_daily_sheets_on_student_member_id"
    t.index ["subject_id"], name: "index_daily_sheets_on_subject_id"
    t.index ["textbook_id"], name: "index_daily_sheets_on_textbook_id"
  end

  create_table "events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.date "starts_on"
    t.date "ends_on"
    t.integer "repeats_on"
    t.integer "event_type"
    t.bigint "period_id"
    t.bigint "student_member_id"
    t.bigint "staff_member_id"
    t.bigint "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["period_id"], name: "index_events_on_period_id"
    t.index ["staff_member_id"], name: "index_events_on_staff_member_id"
    t.index ["student_member_id"], name: "index_events_on_student_member_id"
    t.index ["subject_id"], name: "index_events_on_subject_id"
  end

  create_table "examinations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "academic_year", null: false
    t.bigint "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_examinations_on_school_id"
  end

  create_table "notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.integer "daily_sheet_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.index ["email"], name: "index_parent_members_on_email", unique: true
  end

  create_table "periods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "number_of_period", null: false
    t.datetime "start_of_period", null: false
    t.datetime "end_of_period", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.boolean "important", default: false
    t.bigint "staff_member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["staff_member_id"], name: "index_posts_on_staff_member_id"
  end

  create_table "schools", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "school_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "score_sheets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_member_id"
    t.bigint "staff_member_id"
    t.bigint "examination_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["examination_id"], name: "index_score_sheets_on_examination_id"
    t.index ["staff_member_id"], name: "index_score_sheets_on_staff_member_id"
    t.index ["student_member_id"], name: "index_score_sheets_on_student_member_id"
  end

  create_table "scores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "point", null: false
    t.bigint "score_sheet_id"
    t.bigint "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["score_sheet_id"], name: "index_scores_on_score_sheet_id"
    t.index ["subject_id"], name: "index_scores_on_subject_id"
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
    t.index ["email"], name: "index_staff_members_on_email", unique: true
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
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "staff_member_id"
    t.bigint "parent_member_id"
    t.bigint "school_id"
    t.index ["family_name_kana"], name: "index_student_members_on_family_name_kana"
    t.index ["given_name_kana"], name: "index_student_members_on_given_name_kana"
    t.index ["parent_member_id"], name: "index_student_members_on_parent_member_id"
    t.index ["school_id"], name: "index_student_members_on_school_id"
    t.index ["staff_member_id"], name: "index_student_members_on_staff_member_id"
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
    t.bigint "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_textbooks_on_subject_id"
  end

  add_foreign_key "daily_sheets", "periods"
  add_foreign_key "daily_sheets", "staff_members"
  add_foreign_key "daily_sheets", "student_members"
  add_foreign_key "daily_sheets", "subjects"
  add_foreign_key "daily_sheets", "textbooks"
  add_foreign_key "events", "periods"
  add_foreign_key "events", "staff_members"
  add_foreign_key "events", "student_members"
  add_foreign_key "events", "subjects"
  add_foreign_key "examinations", "schools"
  add_foreign_key "posts", "staff_members"
  add_foreign_key "score_sheets", "examinations"
  add_foreign_key "score_sheets", "staff_members"
  add_foreign_key "score_sheets", "student_members"
  add_foreign_key "scores", "score_sheets"
  add_foreign_key "scores", "subjects"
  add_foreign_key "student_members", "parent_members"
  add_foreign_key "student_members", "schools"
  add_foreign_key "student_members", "staff_members"
  add_foreign_key "takes", "student_members"
  add_foreign_key "takes", "subjects"
  add_foreign_key "textbooks", "subjects"
end
