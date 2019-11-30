# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_29_061318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "post_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "year"
    t.string "code"
  end

  create_table "courses_repos", id: false, force: :cascade do |t|
    t.bigint "repo_id", null: false
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_courses_repos_on_course_id"
    t.index ["repo_id"], name: "index_courses_repos_on_repo_id"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "repo_id"
    t.index ["repo_id"], name: "index_items_on_repo_id"
  end

  create_table "offerings", force: :cascade do |t|
    t.string "course_id"
    t.float "cost", default: 0.0
    t.datetime "startTime"
    t.datetime "endTime"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "status", default: "Free"
    t.bigint "organizer_id"
    t.bigint "attendee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendee_id"], name: "index_offerings_on_attendee_id"
    t.index ["organizer_id"], name: "index_offerings_on_organizer_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_posts_on_course_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "repos", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "public"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "repos_users", id: false, force: :cascade do |t|
    t.bigint "repo_id", null: false
    t.bigint "user_id", null: false
    t.index ["repo_id", "user_id"], name: "index_repos_users_on_repo_id_and_user_id"
    t.index ["user_id", "repo_id"], name: "index_repos_users_on_user_id_and_repo_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "offerings", "users", column: "attendee_id"
  add_foreign_key "offerings", "users", column: "organizer_id"
end
