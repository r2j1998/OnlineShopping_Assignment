# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160208112209) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name",      limit: 255
    t.integer  "shipper_detail_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "companies", ["shipper_detail_id"], name: "index_companies_on_shipper_detail_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "fname",                  limit: 255
    t.string   "lname",                  limit: 255
    t.integer  "mobile_no",              limit: 4
    t.date     "birth_date"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "category_id",        limit: 4
    t.integer  "company_id",         limit: 4
    t.string   "product_name",       limit: 255
    t.text     "description",        limit: 65535
    t.float    "price",              limit: 24
    t.integer  "quantity",           limit: 4
    t.string   "sku",                limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree

  create_table "shipper_addresses", force: :cascade do |t|
    t.string   "city",              limit: 255
    t.string   "district",          limit: 255
    t.string   "state",             limit: 255
    t.string   "country",           limit: 255
    t.integer  "pincode",           limit: 4
    t.integer  "shipper_detail_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "shipper_addresses", ["shipper_detail_id"], name: "index_shipper_addresses_on_shipper_detail_id", using: :btree

  create_table "shipper_details", force: :cascade do |t|
    t.string   "fname",      limit: 255
    t.string   "lname",      limit: 255
    t.string   "email",      limit: 255
    t.integer  "mobile_no",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "city",        limit: 255
    t.string   "district",    limit: 255
    t.string   "state",       limit: 255
    t.string   "country",     limit: 255
    t.integer  "pincode",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "customer_id", limit: 4
  end

  add_index "shipping_addresses", ["customer_id"], name: "index_shipping_addresses_on_customer_id", using: :btree

  add_foreign_key "companies", "shipper_details"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "companies"
  add_foreign_key "shipping_addresses", "customers"
end
