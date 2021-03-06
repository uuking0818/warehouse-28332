# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_25_111610) do

  create_table "plates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mold_id", null: false
    t.integer "thickness_id", null: false
    t.integer "hardness_id", null: false
    t.integer "plate_color_id", null: false
    t.integer "plate_width_id", null: false
    t.integer "plate_length_id", null: false
    t.integer "number_of_sheets", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_plates_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "employee_number", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "warehouse_number", null: false
    t.string "warehouse_colum", null: false
    t.integer "house_number", null: false
    t.integer "number_of_stage", null: false
    t.bigint "user_id", null: false
    t.bigint "plate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plate_id"], name: "index_warehouses_on_plate_id"
    t.index ["user_id"], name: "index_warehouses_on_user_id"
  end

  add_foreign_key "plates", "users"
  add_foreign_key "warehouses", "plates"
  add_foreign_key "warehouses", "users"
end
