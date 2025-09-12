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

ActiveRecord::Schema[8.0].define(version: 2025_09_12_142222) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "expense_items", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.string "name", null: false
    t.decimal "unit_price", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "quantity", null: false
    t.bigint "unit_type_id", null: false
    t.decimal "total_price", precision: 12, scale: 2, default: "0.0", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_expense_items_on_expense_id"
    t.index ["unit_type_id"], name: "index_expense_items_on_unit_type_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.datetime "expense_at", precision: nil, null: false
    t.decimal "total_price", precision: 12, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finances", force: :cascade do |t|
    t.decimal "production_cost", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "net_profit", precision: 12, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_stocks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "quantity", null: false
    t.bigint "unit_type_id", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_type_id"], name: "index_ingredient_stocks_on_unit_type_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "cost_price", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "selling_price", precision: 12, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "sales_entry_id", null: false
    t.bigint "sales_channel_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_on_product_id"
    t.index ["sales_channel_id"], name: "index_sales_on_sales_channel_id"
    t.index ["sales_entry_id"], name: "index_sales_on_sales_entry_id"
  end

  create_table "sales_channels", force: :cascade do |t|
    t.string "name", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_entries", force: :cascade do |t|
    t.string "sale_code", null: false
    t.datetime "sale_at", precision: nil, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_code"], name: "index_sales_entries_on_sale_code", unique: true
  end

  create_table "sales_reports", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.decimal "cost_price", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "selling_price", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "sold_quantity", null: false
    t.integer "unsold_quantity", null: false
    t.decimal "revenue", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "grass_profit", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "loss", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "net_profit", precision: 12, scale: 2, default: "0.0", null: false
    t.boolean "is_collected", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_sales_reports_on_sale_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "stock_entries", force: :cascade do |t|
    t.datetime "entry_at", precision: nil, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_receipts", force: :cascade do |t|
    t.bigint "stock_entry_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_stock_receipts_on_product_id"
    t.index ["stock_entry_id"], name: "index_stock_receipts_on_stock_entry_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name", null: false
    t.integer "quantity", null: false
    t.bigint "unit_type_id", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_type_id"], name: "index_supplies_on_unit_type_id"
  end

  create_table "unit_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.integer "user_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "expense_items", "expenses"
  add_foreign_key "expense_items", "unit_types"
  add_foreign_key "ingredient_stocks", "unit_types"
  add_foreign_key "sales", "products"
  add_foreign_key "sales", "sales_channels"
  add_foreign_key "sales", "sales_entries"
  add_foreign_key "sales_reports", "sales"
  add_foreign_key "sessions", "users"
  add_foreign_key "stock_receipts", "products"
  add_foreign_key "stock_receipts", "stock_entries"
  add_foreign_key "supplies", "unit_types"
end
