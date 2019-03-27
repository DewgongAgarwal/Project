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

ActiveRecord::Schema.define(version: 2019_03_27_081356) do

  create_table "a_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_table1s", force: :cascade do |t|
    t.integer "post_id"
    t.integer "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_table2s", force: :cascade do |t|
    t.string "post_id"
    t.string "integer"
    t.integer "data"
    t.integer "poster_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_table3s", force: :cascade do |t|
    t.string "post_id"
    t.string "integer"
    t.integer "data"
    t.integer "poster_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_table4s", force: :cascade do |t|
    t.string "post_id"
    t.string "integer"
    t.integer "data"
    t.integer "poster_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parent1s", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parent2s", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_data_table1s", force: :cascade do |t|
    t.integer "post_id"
    t.integer "data"
    t.integer "poster_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_data_table2s", force: :cascade do |t|
    t.integer "post_id"
    t.integer "data"
    t.integer "poster_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_data_table3s", force: :cascade do |t|
    t.integer "post_id"
    t.integer "data"
    t.integer "poster_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_data_table4s", force: :cascade do |t|
    t.integer "post_id"
    t.integer "data"
    t.integer "poster_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_data_table5s", force: :cascade do |t|
    t.integer "post_id"
    t.integer "data"
    t.integer "poster_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_table1", force: :cascade do |t|
    t.integer "post_id"
    t.integer "data"
  end

  create_table "post_table1s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "stud_id"
    t.integer "category"
    t.integer "subcategory"
    t.text "data"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "types1"
    t.integer "sign_id"
    t.text "signature"
    t.text "postkey"
    t.text "studentSign"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "samples", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "keys"
    t.string "token"
    t.datetime "timestamp"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.integer "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "keys"
    t.string "token"
    t.datetime "timestamp"
  end

  create_table "t_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "teacher_posts", force: :cascade do |t|
    t.integer "teacher_id"
    t.text "data"
    t.integer "subcategory"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.text "postkey"
    t.integer "sign_id"
    t.text "signature"
    t.text "teacherSign"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.integer "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "keys"
    t.string "token"
    t.datetime "timestamp"
  end

  create_table "testings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
