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

ActiveRecord::Schema.define(version: 2020_05_24_080317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "wine_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["wine_id"], name: "index_comments_on_wine_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "wine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labellings", force: :cascade do |t|
    t.bigint "wine_id"
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_labellings_on_label_id"
    t.index ["wine_id"], name: "index_labellings_on_wine_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.string "name", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wines", force: :cascade do |t|
    t.text "image", null: false
    t.integer "price", null: false
    t.string "kind", null: false
    t.string "variety"
    t.string "country", null: false
    t.string "origin", null: false
    t.string "name", null: false
    t.integer "taste"
    t.integer "ranking", null: false
    t.text "overview"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.date "vintage", default: "2020-05-12", null: false
    t.index ["user_id"], name: "index_wines_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "wines"
  add_foreign_key "labellings", "labels"
  add_foreign_key "labellings", "wines"
  add_foreign_key "wines", "users"
end
