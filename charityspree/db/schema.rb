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

ActiveRecord::Schema.define(version: 20171117201807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "charities_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charities_id"], name: "index_donations_on_charities_id"
    t.index ["users_id"], name: "index_donations_on_users_id"
  end

  create_table "user_achievements", force: :cascade do |t|
    t.bigint "achievements_id"
    t.bigint "users_id"
    t.boolean "achieved"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievements_id"], name: "index_user_achievements_on_achievements_id"
    t.index ["users_id"], name: "index_user_achievements_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "donations", "charities", column: "charities_id"
  add_foreign_key "donations", "users", column: "users_id"
  add_foreign_key "user_achievements", "achievements", column: "achievements_id"
  add_foreign_key "user_achievements", "users", column: "users_id"
end
