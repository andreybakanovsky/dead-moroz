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

ActiveRecord::Schema.define(version: 2021_12_14_052703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "deads_choice", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "giftable_type"
    t.bigint "giftable_id"
    t.index ["giftable_type", "giftable_id"], name: "index_gifts_on_giftable"
  end

  create_table "goods", force: :cascade do |t|
    t.integer "year", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_goods_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "email"
    t.date "expire_at"
    t.text "url"
    t.integer "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "karmas", force: :cascade do |t|
    t.integer "value", default: 0
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_karmas_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "grade", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "good_id", null: false
    t.bigint "user_id", null: false
    t.index ["good_id"], name: "index_reviews_on_good_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", default: 0
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "goods", "users"
  add_foreign_key "invitations", "users"
  add_foreign_key "karmas", "users"
  add_foreign_key "reviews", "goods"
  add_foreign_key "reviews", "users"
end
