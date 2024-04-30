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

ActiveRecord::Schema[7.0].define(version: 2024_04_30_023344) do
  create_table "clipboards", force: :cascade do |t|
    t.string "area"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventorysheets", force: :cascade do |t|
    t.date "date"
    t.boolean "is_holiday"
    t.boolean "is_complete"
    t.integer "user_id"
    t.integer "clipboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "category"
    t.string "product_type"
    t.string "label"
    t.string "unit"
    t.float "price"
    t.float "pack_size"
    t.string "item_size"
    t.float "pack_cost"
    t.integer "user_id"
    t.string "area"
    t.integer "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "par_level"
    t.integer "rank"
    t.text "comment"
    t.integer "inventory_sheets_id"
    t.integer "clipboard_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "item_id"
    t.integer "inventory_sheets_id"
    t.float "quantity"
    t.float "on_hand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "organization_name"
    t.string "general_manager_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "company_name"
    t.string "rep_name"
    t.string "rep_email"
    t.string "rep_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

end
