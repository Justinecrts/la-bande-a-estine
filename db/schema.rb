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

ActiveRecord::Schema.define(version: 20170702160647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_headbands", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "headband_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "quantity",    default: 1
    t.index ["cart_id"], name: "index_cart_headbands_on_cart_id", using: :btree
    t.index ["headband_id"], name: "index_cart_headbands_on_headband_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "archived",   default: false
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headbands", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "quantity"
    t.text     "description"
    t.string   "image_url"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_headbands_on_category_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.integer  "amount"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "status",     default: "pending"
    t.index ["cart_id"], name: "index_orders_on_cart_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "place"
    t.string   "adress"
    t.string   "adress_complement"
    t.string   "postcode"
    t.string   "city"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cart_headbands", "carts"
  add_foreign_key "cart_headbands", "headbands"
  add_foreign_key "carts", "users"
  add_foreign_key "headbands", "categories"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "users"
end
