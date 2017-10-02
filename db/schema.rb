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

ActiveRecord::Schema.define(version: 20171002192428) do

  create_table "audition_requests", force: :cascade do |t|
    t.integer "actor_id"
    t.integer "role_id"
    t.boolean "accepted?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productions", force: :cascade do |t|
    t.string "title"
    t.string "production_type"
    t.integer "budget"
    t.date "date_begin"
    t.date "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "studio_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "actor_id"
    t.integer "production_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "leading?"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.integer "base_salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "is_studio"
  end

end
