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

ActiveRecord::Schema.define(version: 2022_09_28_201324) do

  create_table "articles", charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gift_types", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", charset: "latin1", force: :cascade do |t|
    t.bigint "gift_type_id", null: false
    t.string "title"
    t.integer "wishlist_max"
    t.float "price_min"
    t.float "price_max"
    t.float "fixed_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_type_id"], name: "index_lists_on_gift_type_id"
  end

  create_table "user_lists", charset: "latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_user_lists_on_list_id"
    t.index ["user_id"], name: "index_user_lists_on_user_id"
  end

  create_table "users", charset: "latin1", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wish_lists", charset: "latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.string "gift_name"
    t.string "gift_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_wish_lists_on_list_id"
    t.index ["user_id"], name: "index_wish_lists_on_user_id"
  end

  add_foreign_key "lists", "gift_types"
  add_foreign_key "user_lists", "lists"
  add_foreign_key "user_lists", "users"
  add_foreign_key "wish_lists", "lists"
  add_foreign_key "wish_lists", "users"
end
